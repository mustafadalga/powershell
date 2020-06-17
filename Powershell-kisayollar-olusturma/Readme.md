# Powershell'de Kısayollar Oluşturma

## Problem 

PowerShell ile çalışırken iki şeyi sık sık yapmam gerektiğini fark ettim:

1. Masaüstü dizinine geçiş yapma
2. PowerShell profilimi düzenleme

Bu yüzden, Masaüstü dizinime (Örn. C:\Users\Can\Desktop) tek bir kısacık komutla, (örn:  masaustu) geçiş yapabilmek istiyorum.

PowerShell oturumuma bu özelliği nasıl kazandırabilirim?

PowerShell profilimi ```profil-duzenle``` diye kısacık bir komutla yapabilmek istiyorum. Bu komutu her verdiğimde not defteri ile *.ps1 uzantılı kullanıcı profil dosyam açılsın. Powershell'e bu özelliği nasıl kazandırabilirim?

Bu yaptığım şeylerin arkadaşlarım tarafından da kullanılmasını istiyorum. Adı ```yeni-ozellikler-ekle.ps1```  olan öyle bir script yazayım ki, o script'in dosyasını arkadaşımla paylaşacağım ve arkadaşım bu script'i çalıştırdığında yukarıdaki 1. ve 2. basamaktaki özellikler onun bilgisayarında da aktifleşsin. 

Dikkat edilmesi gereken nokta: benim bilgisayarımdaki kullanıcı ev dizinim C:\Users\Can iken arkadaşımın bilgisayarındaki kullanıcı ev dizini C:\Users\Ahmet olabilir, dolayısıyla bu sorunu aşmak için ortam değişkenlerinden yararlanmamız gerekecek.


## Çözüm

Powershell profil dosyası , powershell üzerinde yeni komutlar , fonksiyonlar ya da ceşitli işlemler yapmak için kullandığımız bir dosyadır.

Örneğin **cd,get-children,move-item,copy-item,update-help,stop-computer...**  bunların hepsi birer fonksiyondur.
Powershell profil dosyası ile yukarıdaki komutlar gibi biz de komut oluşturabiliriz.
Powershell'in profil dosyası varsayılan olarak bilgisayarlarda  bulunmaz.


Bilgisayarınızda profil dosyasının olup olmadığını ve yoksa nasıl oluşturduğunu öğrenmek için aşağıdaki kaynağa bakınız.
* https://www.howtogeek.com/126469/how-to-create-a-powershell-profile/



```notepad $profile``` komutunu girerek diyerek profil dosyasını açıyoruz.

Masaustune dizinine geçiş yapma ve profilini düzenle(notepad $profil) olarak 2 fonksiyon oluşturacağız.

masaustune gitmek için aşağıdaki gibi bir fonksiyon kullanılabilir.

```
function masaustu
{
	cd ~\Desktop
}
```

Powershell ekranında masaustu komutunu calıstırdığınızda masaüstü dizinine geçiş yapılacaktır.

Powershell profil dosyasını acmak için ```notepad $profile``` diye bir komut giriyorduk.Komutu kendimize göre değiştirmek için ```profil-duzenle``` adında bir fonksiyon oluşturacağız.

```
function profil-duzenle
{
  notepad $profile
}
```

Yukarıda oluşturduğumuz fonksiyonların etkinleştirilmesi için profil dosyasını kaydedip powershell'i yeniden açmanız gerekiyor.

Yukarıda oluşturduğumuz 2 fonksiyonun herhangi bir bilgisayarda çalışması için de bir script oluşturacağız.

Aşağıdaki gibi  ```yeni-ozellikler.ps1``` adında bir dosya oluşturdum ve içine yukarıda oluşturduğum fonksiyonları ekledim.

```
echo "function masaustu{cd ~\Desktop} function profil-duzenle() {notepad $profile }" >$profile;
```

**Not:** Yukarıda anlatılan işlemlerin bilgisayarınızda çalışması için ,eğer yoksa $profile dosyasının oluşturulması gerekiyor.
