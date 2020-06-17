# Youtube Video İndir V1

## Problem

Chocolatey paket yöneticisi sayesinde kurabileceğimiz **youtube-dl** adlı paket, basit bir youtube video indiricisi. Bir kez kurmanızın ardından powershell'de aşağıdaki gibi bir kullanımla youtube videosunu bilgisayarınıza mp4 video uzantılı bir dosya olarak indirmenizi sağlıyor.

```
 youtube-dl https://youtube.com/indireceginiz-videonun-linki 
 ```

Arkadaşımdan aldığım şöyle bir videolar.txt dosyası var. Bu dosyada her satırda adresi yer alan tüm videoları bilgisayarıma indirmek istiyorum. İzlemem gereken adımlar nelerdir? 
Videolar.txt dosyasını satır satır okuyarak, youtube video linki bulunan satırlardaki her videoyu indirecek bir script'ini nasıl yazabilirim?

## Çözüm

Bu problemin çözümününe gitmeden önce yapmamız gereken 2 işlem var:

1. Chocolatey paket yöneticisi kurulumunu yapmak.
2. Listedeki videoları indirebilmek için, chocolatey paket yöneticisi içerisinden youtube-dl uygulamasını kurmak.

### Chocolatey Kurulumu

**Chocolatey paket yöneticisi kurulum**

```
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

**Chocolatey paket yöneticisini son sürüme yükseltme**

```
choco upgrade chocolatey
```


### youtube-dl Kurulumu;



**youtube-dl kurulum**

```
choco install youtube-dl
```
**youtube-dl son sürüme yükseltme**

```
choco upgrade youtube-dl
```


Yukarıdaki işlemleri tamamladıktan sonra aşağıdaki komut satırı ile sorunun çözümüne ulaşabilirsiniz.cat komutu ile videolar.txt içeri aktarılır ve foreach döngüsü ile satırları teker teker alıp indirmeye başlar.

**Kullanım**
```

cat .\videolar.txt | % { youtube-dl $_; }

```