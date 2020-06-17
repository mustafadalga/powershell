# Resim İndirme Scripti

**url'sini girdiğiniz bir resmi indirmenizi sağlayan bir script.**

### Örnek Kullanım:

```
.\resim_indir.ps1 -url https://www.google.com.tr/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png                                                                        
```


###  Kodlar:

```
param($url);

$dosya = New-Object System.Net.WebClient
[string]$isim=Get-Random;

$dosya.DownloadFile($url, ($isim+".jpg"));

Invoke-WebRequest $url -OutFile ($isim+".jpg")

```