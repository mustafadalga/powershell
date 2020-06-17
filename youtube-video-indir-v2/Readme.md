# Youtube Video İndir V2

## Problem

**youtube-video-indir** script'inde youtube-dl programını kullanarak internetten linki verilmiş youtube videolarını nasıl indirebileceğimizi gördük. Şimdi işler biraz daha çetrefilli hale geliyor.

Öyle bir  script'i yazalım ki, aşağıdaki gibi bir kullanım ile kullandığımızda

```
.\alakali-videolari-indir.ps1 -AnaVideo https://youtube.com/ana-videonun-linki
```


1. Parametre olarak verdiğimiz "ana video linki"nde yer alan videoyu youtube-dl ile download etsin.
2. Bu ana videonun yanı sıra, ana videonun web sayfasında sağ sekmede yer alan diğer "önerilen videolar" kısmında yer alan videoların ilk 5 tanesini de download etsin.

<hr>

Önerilen videolar ile ne kastediyoruz? Örneğin:


![video](https://user-images.githubusercontent.com/25087769/84864435-56187500-b07f-11ea-8c3b-106df18536e2.png)



Yukarıdaki  ekran görüntüsünde ana video [Tarık Güney'in](https://github.com/tarikguney) [Docker Öğreniyorum - Birinci Bölüm](https://www.youtube.com/watch?v=g_Q7TDsrwgo) gösterilirken, önerilen videolar da sağda kalan aşağıdaki videolar gösterilmektedir.

- Docker Öğreniyorum - İkinci Bölüm
- VMware - Sanal Makine Nasıl Kurulur ? ( 2019 )  Tüm Özellikler
- Tüm yönleriyle Docker
- REST nedir? REST ile SOAP arasında ki fark? REST ve HTTP protokolünün arasında ki ilişki
- İnsanlar Daha Az Acı Çeksin Diye Kod Yazıyorum - Yazılımcı Sohbetleri (Jaana Burcu Doğan)

Script'imizi çalıştırdığımızda sadece ana videonun linkini vereceğiz, script bizim için önerilen videolardan ilk 5'ini bulacak ve bunları da indirecek.

**İpucu:** Wget veya Curl gibi kısayolları bulunan Invoke-WebRequest komutunu kullanmamız gerekecek. Bu komut, bir web sitesine tıpkı web tarayıcısıyla çalışır gibi http isteği gönderip html formatında cevap alabilmemizi sağlar.

## Çözüm

Problemin çözümü için kullanılabilecek script kodları

```
param($AnaVideo);
youtube-dl $AnaVideo;
$HTML=Invoke-WebRequest -Uri $AnaVideo
$HTML.Links | Where-Object { $_.href -like '/watch*' -and $_.title } | % { "https://www.youtube.com"+$_.href; } | select -First 5 | % {  youtube-dl $_; }
```

**Örnek Kullanım**

```

.\alakali-videolari-indir.ps1 -AnaVideo  https://www.youtube.com/watch?v=3-iCDOYkfms

```


Çözüme geçmeden önce youtube-video-indir v1 anlatıldığı gibi chocolatey paket yöneticisi ve youtube-dl paketinin kurulu olması gerekmektedir.

Youtube'daki önerilen videoların linki, aşağıdaki adresteki resimde görüldüğü /watch......... diye devam ediyor.

![resim](https://user-images.githubusercontent.com/25087769/84865639-3e41f080-b081-11ea-9969-bb59103d3aed.png)

SQL sorgu dilinde kullanılan -like komutunu,buraya uyarlayarak  "/watch" ile başlayıp devam eden tüm linkleri çekip,bu çekmiş olduğum linkler üzerinden işlem yapacağım.

Problem de, ```.\alakali-videolari-indir.ps1 -AnaVideo VideoUrl'```si gibi bir kullanım olmasını istediği için , -AnaVideo diye bir parametre ekleyip ana video linkini alacağım.
Aşağıdaki gibi bir yapı kullanarak ,(-AnaVideo) adında bir parametre oluşturdum ki video url'ini alabilirim.

```
param($AnaVideo);
```

Ana videoyu'da zaten indireceğimiz için ,aşağıdaki komut ile ana video için indirme yapıyoruz.

```
youtube-dl $AnaVideo;
```


**Invoke-WebRequest** komutunu kullanarak ana videonun olduğu web sayfasının içeriğini alıp,üzerinen işlem yapmak üzere $HTML adlı bir değişkene atıyorum.

```
$HTML=Invoke-WebRequest -Uri $AnaVideo
```

En önemli yere geldik.

1. Aşağıdaki komut anavideo sayfasının içerisindeki tüm linkleri seçiyoruz.

```
$HTML.Links
```

2. Aşağıdaki komut ile,**/watch** ifadesi ile başlayan ve  videonun ismi olan linkleri seçiyoruz.Böylece sağ kısımdaki önerilen videoların hepsini seçmiş olduk.

```
Where-Object { $_.href -like '/watch*' -and $_.title }
```

Önerilen videoların linkleri aşağıdaki gibi çıkıyor.

```
/watch?v=3QfDDKkxXUc
/watch?v=Bdt0pz5C4Xc
/watch?v=YN7FuT5vJ7c	
/watch?v=myM2j6rbjIo
.........
```




3. Bu sorununda üstesinden gelmek için de foreach(% ,foreach'nin kısa yoludur.) döngüsünü kullanarak her birinin başına ```https://www.youtube.com```'u ekliyoruz.

```
 % { "https://www.youtube.com"+$_.href; }
```

4. Problem de ilk 5 video istenildiği için,aşağıdaki komut ile ilk 5 videonun linkini seçiyorum.

```
 select -First 5 
```

5. Son olarak seçilen 5 videonun indirme işlemini başlatıyoruz.

```
   % {  youtube-dl $_; }
```



## Uyarı

- Youtube çok dinamik bir sistem ve sürekli olarak(Bazen her gün,bazen de gün de iki kez) algoritmasını güncelliyor.Youtube arama sonuçlarını ve önerilen videoları karşımıza çıkarırken kullanıcı deneyimlerini ve görüşlerini de dikkate alıyor.Dolayısıyla  bir video'yu izlerken ,videoyu tekrardan açtığında önerilen videolar değişmiş olabilir.