# Akademik İş İlanları

## Problem

Akademik personel olmak istiyorum.
Bu nedenle, üniversitelerin zaman zaman yayınladığı akademik personel iş ilanlarını takip etmem gerekiyor. Bu ilanları, toplu bir biçimde paylaşan şöyle bir web sitesi olduğunu biliyorum:

* https://www.akademikpersonel.org/anasayfa/akademik-ilanlar/

Bu ilanları günü gününe takip edip, yeni ilanlar çıkınca haberdar olmak istiyorum ki herkesten önce başvurabileyim!

Bu yüzden öyle bir script'im olsun ki, çalıştırdığımda benim için akademikpersonel.org'a baksın ve, en azından ilk sayfadaki ilanları bir köşeye kaydetsin.

Ama asıl espri bu değil, asıl espri şu: Bu script'i her çalıştırdığımda, bir önceki çalıştırmamın sonuçları ile kıyaslasın ve bana şunu diyebilsin:

```
Son baktığınız zaman: 24 Kasım 2018. 
Bugün: 25 Kasım 2018 
Son baktığınızdan beri yeni bir personel ilanı eklenmemiş.
```

Ya da
```
Son baktığınız zaman: 24 Kasım 2018. 
Bugün: 25 Kasım 2018 
Son baktığınızdan beri eklenen yeni personel ilanları var! Bunlar:
1) X Üniversitesi Akademik Kadro İlanı. Linki: https://ilanin-linki
2) Y Üniversitesi Akademik Kadro İlanı. Linki: https://ilanin-linki
```

<hr>

1. Böyle bir script'i nasıl  yapabilirim.

2.  Bu script'imin her gün saat 13:00'da otomatik olarak çalışmasını nasıl sağlayabilirim. (ipucu: New-ScheduledTaskAction, New-ScheduledTask, Register-ScheduledTask)

## Çözüm

Bu sorunun çözümü için;

1. İstenilen işlemleri gercekleştirmek
2. Bu işlemleri hergün yaptırtmak için 2 tane script kullandım.

Hepsini tek bir scriptte yapmamamın nedeni  scriptlerden bir tanesi sadece tek kullanımlık olacak ve tek kullanımdan sonra onunla işimiz olmayacak.

Tek kullanımlık script ise zamanlanmış bir görev olacaktır.Powershell ile zamanlanmış bir görev oluşturduğunuzda , Windows'un zamanlanmış görevleri arasına girecektir ve bilgisayarınızı yeniden başlatsanız bile siz silmediğiniz sürece zamanlanmış görev aktif olacaktır.



Akademik Personel ilanları probleminin çözümü için script kodları;

```
cd ~\Desktop;

$HTML=Invoke-WebRequest -Uri https://www.akademikpersonel.org/anasayfa/akademik-ilanlar/

$mesaj=0;

If(Test-Path .\ilanlar.txt)
{
    $ilanlar=Get-Content .\ilanlar.txt;
    $mesaj=1;
}
else
{
    ni .\ilanlar.txt;
    $ilanlar=Get-Content .\ilanlar.txt;
    $mesaj=0;
}

$SonKontrolTarihi=(Get-Item .\ilanlar.txt | Foreach {$_.LastWriteTime}).ToLongDateString();
$Suan=(get-date -UFormat "%d %B %A %G");


$YeniIlanlar=@();

$HTML.ParsedHtml.getElementsByTagName('div') |
  Where-Object { $_.className -eq 'info' } |
  ForEach-Object { $_.getElementsByTagName('a') } |
  Where-Object { $_.className -eq 'title' } | % {
  
       If(($_.outertext +"  : " +$_.href) -notin $ilanlar)
       {
        echo ($_.outertext +"  : " +$_.href) >>.\ilanlar.txt;
        $YeniIlanlar+=($_.outertext +"  : " +$_.href);
       }
   }


   If($mesaj -eq 1)
   {
       If($YeniIlanlar.Count -gt 0)
       {
          echo ("Son baktığınız zaman:"+$SonKontrolTarihi);
          echo ("Bugün:"+$Suan);
          echo "Son baktığınızdan beri eklenen yeni personel ilanları var! Bunlar:";
  
          for($i=0; $i -le $YeniIlanlar.Count-1; $i++)
          {
             echo ([string]($i+1)+")"+$YeniIlanlar[$i]);
          }
       }
       else
       {
           echo ("Son baktığınız zaman:"+$SonKontrolTarihi);
           echo ("Bugün:"+$Suan);
           echo "Son baktığınızdan beri yeni bir personel ilanı eklenmemiş.";   
       }   
   }
   else
   {
       If($YeniIlanlar.Count -gt 0)
       {
          echo "Yeni personel ilanları var! Bunlar:";
          $YeniIlanlar;
       }
       else
       {
          echo "Yeni bir personel ilanı eklenmemiş.";   
       }      
   }
```

Yukarıdaki script'i her gün belirlenen saatte çalıştırmak için de gerekli script kodları;

```
$masaustu = [Environment]::GetFolderPath("Desktop");
$yol="$masaustu\script.ps1";
$saat= New-ScheduledTaskTrigger -At 13:00 -Daily 
$uygulama= New-ScheduledTaskAction -Execute "PowerShell.exe"  -Argument "-executionpolicy bypass -NoExit -noprofile -file $yol" 
Register-ScheduledTask -TaskName Gorev -Trigger $saat -Action $uygulama -RunLevel Highest -Force

```



Powershell normal olarak açtığınızda kullanıcı dizininde olur.Yönetici olarak actığınızda ise system32 dizininde açılır.
Yukarıdaki dizinler yerine masaüstü dizininde çalışmak istediğim için ilk iş olarak masaüstüne geçiş yapıyorum ve Invoke-WebRequest komutu ile ilgili web sitesindeki adresi ,üzerinden işlem yapmak üzere çekip bir değişkene aktarıyorum.

```

cd ~\Desktop;
$HTML=Invoke-WebRequest -Uri https://www.akademikpersonel.org/anasayfa/akademik-ilanlar/

```



Bu soruyu çözerken bir kısım ihtimalleri göz önünde bulundurarak çözdüm.
bu script ilk çalıştırıldında ilk kullanım olacağı için sonuç ekranında "Son baktığınızdan beri " gibi bir ifade kullanmak doğru olmaz çünkü zaten bu script'i ilk kez çalıştırıyoruz.

Aşağıdaki gibi mesaj adında bir değişken tanımladım.Varsayılan değerini 0 atadım.Eğer mesaj değeri 0 ise bu script ilk kez kullanılıyordur eğer 1 ise daha önce de çalıştırılmıştır demektir.
Bunu dinamik olarak belirlemek için de ilanlar.txt dosyasının olup olmadığına bakacağım.

Varsayılan olarak ilanlar.txt diye bir dosya yok.Script'i çalıştırıldıktan sonra yani ilk kullanımdan sonra ilanlar.txt dosyası oluşturulacak.

if ile ilanlar.txt dosyasının olup olmadığını kontrol ettim.Eğer boyle bir dosya varsa script daha önce çalıştırılmıştır demektir.$mesaj değerini 1 yapıp ,ilanlar.txt dosyasını içeri aktarıyoruz ki yeni eklenmiş ilanlar ile  ilanlar.txt içeriğini kontrol edelim.Böylece yeni ilanlar var mı yok mu durumunu değerlendireceğiz.
Eğer ilanlar.txt diye bir dosya yoksa da dosyayı oluşturuyoruz.

```
$mesaj=0;

If(Test-Path .\ilanlar.txt)
{
    $ilanlar=Get-Content .\ilanlar.txt;
    $mesaj=1;
}
else
{
    ni .\ilanlar.txt;
    $ilanlar=Get-Content .\ilanlar.txt;
    $mesaj=0;
}
```

Son kontrol tarihi ve şuanki tarihi aşağıdaki gibi değişkenlere aktarıyoruz.

```
$SonKontrolTarihi=(Get-Item .\ilanlar.txt | Foreach {$_.LastWriteTime}).ToLongDateString();
$Suan=(get-date -UFormat "%d %B %A %G");
```


Eğer yeni ilanlar varsa bunları bir dizide tutmak için YeniIlanlar adında bir dizi oluşturuyorum.

```
$YeniIlanlar=@();
```

İlgili internet sitesindeki ilanları çekme kısmına geldik.Linklerin bulunduğu tagların yapısı aşağıdaki gibi görünüyor.

```
<div class="listing">
  <article class="list">
    <div class="thumb">
      <div class="info">
        <a class="title" href="...">İlanların linki...</a>
      </div>
    </div>
  </article>
</div>
```

listing class'ının içerisindeki list class'ının içerisindeki thumb class'ının içerisindeki info class'ının içindeki title adındaki  a tagının linklerini almaya çalıştım.



Aşağıdaki gibi bir seçiçi kullanarak ilanları çektim. info class'ının içerisindeki a tagının class'ı title olan ilanları çektim.

Çekilen ilanlar eğer ilanlar.txt içerisinde mevcut değilse ilanlar.txt içerisine ekleyip ayrıca yenilanlar dizisine de yeni ilanları ekledim.

```
$HTML.ParsedHtml.getElementsByTagName('div') |
  Where-Object { $_.className -eq 'info' } |
  ForEach-Object { $_.getElementsByTagName('a') } |
  Where-Object { $_.className -eq 'title' } | % {
  
       If(($_.outertext +"  : " +$_.href) -notin $ilanlar)
       {
        echo ($_.outertext +"  : " +$_.href) >>.\ilanlar.txt;
        $YeniIlanlar+=($_.outertext +"  : " +$_.href);
       }
   }
```

Burada $mesajın durumuna göre kontrol yapıyoruz.Eğer $mesaj değeri 0 ise script'in ilk kez kullanıldığını söylemiştim.$mesaj değeri 1 ise önceden script çalıştırılmıştır.


İf blogunun içerisindeki diğer if ise $YeniIlanlar'ın sayısına göre kontrol yapıyor.Yenilanlar dizisinin uzunluğu 0 ise yeni ilan eklenmemiş demektir.
Yeniilanlar dizisinin uzunluğu 0'den büyükse de yeni ilanları ekranda gösteriyor.

```

    If($mesaj -eq 1)
   {
       If($YeniIlanlar.Count -gt 0)
       {
          echo ("Son baktığınız zaman:"+$SonKontrolTarihi);
          echo ("Bugün:"+$Suan);
          echo "Son baktığınızdan beri eklenen yeni personel ilanları var! Bunlar:";
  
          for($i=0; $i -le $YeniIlanlar.Count-1; $i++)
          {
             echo ([string]($i+1)+")"+$YeniIlanlar[$i]);
          }
       }
       else
       {
           echo ("Son baktığınız zaman:"+$SonKontrolTarihi);
           echo ("Bugün:"+$Suan);
           echo "Son baktığınızdan beri yeni bir personel ilanı eklenmemiş.";   
       }   
   }
   else
   {
       If($YeniIlanlar.Count -gt 0)
       {
          echo "Yeni personel ilanları var! Bunlar:";
          for($i=0; $i -le $YeniIlanlar.Count-1; $i++)
          {
             echo ([string]($i+1)+")"+$YeniIlanlar[$i]);
          }

       }
       else
       {
          echo "Yeni bir personel ilanı eklenmemiş.";   
       }      
   }
```


**Zamanlanmış görev script'ine gelirsek;**

script'im masaüstünde çalıştırılacağı için , powershell çevre bileşenleri ile masaustu dizinin yolunu bir değişkene aktardım ve çalıştırılacak script'in adıyla birleştirdim.

```New-ScheduledTaskTrigger``` ile script'in her gün çalışacağı saati seçtim ve $saat değişkenine attım.

```New-ScheduledTaskAction```  ile belirlenen saatte çalıştırılacak uygulamayı seçtim(powershell) ve uygulamanın(powershell) üzerinde çalışacak scrip'i, ```-Argument``` ekleyerek yolunu belirttim.

```Register-ScheduledTask``` ile saat ve uygulama değişkenlerini yerlerine koyup yönetici olarak çalıştırmasını sağlamak ve olabilecek hataların önüne geçmek için ```-RunLevel Highest``` ve ```-Force``` olarak 2 parametre kullandım.

Zamanlanmış görev için script kodları;


```

$masaustu = [Environment]::GetFolderPath("Desktop");
$yol="$masaustu\script.ps1";
$saat= New-ScheduledTaskTrigger -At 13:00 -Daily 
$uygulama= New-ScheduledTaskAction -Execute "PowerShell.exe"  -Argument "-executionpolicy bypass -NoExit -noprofile -file $yol" 
Register-ScheduledTask -TaskName Gorev -Trigger $Tsaat -Action $uygulama -RunLevel Highest -Force

```




**Not :**Powershell yönetici olarak çalıştırılmalıdır.
