# Videoları Mp3'ye Dönüştürme

## Problem

Bilgisayarımızda bulunan , dinlediğimiz videolu şarkılar var.Bu videoları mp3'e dönüştürüp telefonumuza da atmak istediğimizde ya online internet sitelerini kullanarak , videoları teker teker internet sitesine yükleyip mp3'e çevirme işlemini yapıp tekrardan indiriyoruz ya da bilgisayarımıza kurduğumuz bir program yardımıyla bu videoları dönüştürüyoruz. 

Bu işlemlerle uğraşarak zaman kaybediyoruz.

Bütün bu zaman kaybettiren işlemleri otomatize etmek için bir script oluşturmanızı istiyorum.

Bu scripti videoların bulunduğu klasörde çalıştırdığınızda , içerisinde bulunan klasördeki bütün videoları mp3 formatına dönüştürsün ve aynı klasörün içinde mp3 adında bir klasör oluşturup , oluşturulan mp3 dosyalarını mp3 klasörüne taşısın.

## Çözüm

**Problemin çözümü için gerekli olan script kodları;**

```
 Get-ChildItem -File | %{ 
    If(!($_.Extension -eq '.ps1'))
   {
        $_.BaseName>>.\isimler.txt; $_.Extension>>.\uzantilar.txt
   }
 }

$isimler=Get-Content -Encoding UTF8 .\isimler.txt;
$uzantilar=Get-Content -Encoding UTF8 .\uzantilar.txt;

for($i=0; $i -le (Get-Content .\isimler.txt).Length-1; $i++)
{
     $isim=$isimler[$i]+$uzantilar[$i];
     ffmpeg -i $isim  ($isimler[$i]+".mp3");
}
 if (test-path 'mp3')
    { 
        move .\*.mp3 mp3; 
    }
 else 
   {
     mkdir mp3;
     move .\*.mp3 mp3; 
   }
    
del .\*.txt;
```


Sorunun cevabına geçmeden önce chocolatey paket yöneticisinin bilgisayarınızda kurulu olması gerekiyor.

* Kaynak:https://chocolatey.org/install

Videoları mp3'e dönüştürme işlemi için , chocolatey paket yöneticisinin içerisinden ffmpeg paketini kullanacağız.

### ffmpeg paketinin kurulumu için

**ffmpeg kurulum**

```
choco install ffmpeg
```

**ffmpeg son sürüme yükseltme**

```
choco upgrade ffmpeg
```


Aşağıdaki komut parcasında ```Get-ChildItem -File ``` ile sadece dosyaları listelettim.Foreach döngüsü listelenen dosyaların uzantılarının kontrolünü yapıp , dosya uzantısı .ps1 olmayan bütün dosyaların isimlerini ve uzantılarını txt dosyalarına yazdırdım.

.ps1 dosya uzantısı kontrolü yapmamım sebebi , .ps1 uzantılı scriptim de bu klasör de çalışıyor ve onu es geçiyorum.

isimler.txt ve uzantılar.txt adlı dosyalarda ,isim ve uzantıları tutmamın sebebi videoları dosya isimlerine ve uzantılarına göre seçip dönüştürme işlemi yapacağım.

```
 Get-ChildItem -File | %{ If(!($_.Extension -eq '.ps1')) { $_.BaseName>>.\isimler.txt; $_.Extension>>.\uzantilar.txt } }
```

Aşağıdaki kod parçaları ile de isimler.txt ve uzantılar.txt dosyalarının içeriğini alıp değişkenlere atıyorum.

```
$isimler=Get-Content -Encoding UTF8 .\isimler.txt;
$uzantilar=Get-Content -Encoding UTF8 .\uzantilar.txt;
```

For döngüsü video sayısı kadar işlem yapacağından dolayı 0'dan başlayıp videoların sayısı kadar dönecek.Videoların sayısı isimler.txt ya da uzantılar.txt dosyalarındaki satır sayısı kadardır.(isimler.txt ile uzantılar.txt dosyalarının satır uzunluğu her zaman aynıdır.)

```
for($i=0; $i -le (Get-Content .\isimler.txt).Length-1; $i++)
{
		......
}
```

Videoları mp3'e dönüştürme işlemini for döngüsünün içinden her bir video için yaptırıyoruz.
ffmpeg paketinden sonra gelen ```-i``` parametresi ile hata olduğu durumlarda da kalan diğer videolar için dönüştürme işlemini devam ettirmesini sağladım. ```($isimler[$i]+$uzantilar[$i])``` kısmında dönüştürülecek video'nun adresini seçtim. isimler ve uzantılardan **$i.**ideoyu seçip isimleri ve uzantıları birleştirip adresi oluşturmuş oluyor. ```($isimler[$i]+".mp3")``` kısmında oluşacak mp3'nin ismini ve uzantısının ne olacağını belirtiyorum.```$isimler[$i]``` kullanmanın sebebi video isminin aynı olmasını istememdir.


```
ffmpeg -i ($isimler[$i]+$uzantilar[$i])  ($isimler[$i]+".mp3");
```


Videoları dönüştürme işlemi tamamlandıktan sonra bu mp3 dosyalarını ,mp3 adında bir klasöre taşımam gerekiyordu.```test-path``` fonksiyonu ile mp3 adında bir klasör olup olmadığını kontrol ediyorum.Eğer mp3 adında bir klasör varsa mp3'leri oraya taşıyacak, eğer yoksa da mp3 adında bir klasör oluşturup mp3'leri yeni oluşturulan mp3 adındaki klasöre taşıyacak.

```
 if (test-path 'mp3')
    { 
        move .\*.mp3 mp3; 
    }
 else 
   {
     mkdir mp3;
     move .\*.mp3 mp3; 
   }
   ``` 


Aşağıdaki komut ile de,işimiz bittiği için txt dosyalarını da siliyoruz.

```
del .\*.txt;
```