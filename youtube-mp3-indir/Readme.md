# Youtube Mp3 İndir

## Problem

Youtube üzerinden sürekli müzikler ya da şarkılar dinliyoruz ve bu dinlediklerimizi mp3 olarak indirip telefonumuza da aktarmak istiyoruz.
Bunun için de online internet sitelerini , ya da video olarak indirip çeşitli programlar vasıtasıyla mp3'e dönüştürme işlemi yapıyoruz.

Tüm bu işlemler, hem zaman kaybı hem de arka planda neler döndüğünü bilmediğimiz için kafalarda soru işaretleri bırakabiliyor.


Videoları mp3'e dönüştürdüğümüz internet siteleri güvenli mi?

Videoları mp3'e dönüştürürken arka planda nasıl işlemler döndüğünü biliyor musunuz?

Videolarınız mp3'e dönüştürürken, o dosyaların saf bir mp3 dosyası olduğunu mu düşünüyorsunuz?

Yoksa dönüştürülen mp3 dosyalarının içerisinde bir virüs,trojan veya backdoor(arkakapı) yerleştirip ve bu dosyaları fudlayıp sizin kullandığınız aletlerin ya da teknolojinin kontrolünü ele geçirebileceklerini hiç düşünmediniz mi?(Fudlamak:zararlı kod parçacıklarının antivirüsler tarafından tanınmaması için yapılan işlemler)

Video dönüştürme işlemleri yapan programların arka tarafında,nasıl çalıştığını görmek için tersine mühendislik uygulayabilir musunuz?
(Tersine mühendislik, bir aygıtın, objenin veya sistemin; yapısının, işlevinin veya çalışmasının, çıkarımcı bir akıl yürütme analiziyle keşfedilmesi işlemidir.)

Online sitelerde video dönüştürme işlemleri yaparken,hiç bilgisayarınızda ve tarayıcınızda bir yavaşlama hissettiniz mi? ve bu sitelerin sizin bilgisayarınızı kullanarak veri madenciliği yapabileceğini düşündüğünüz mü?
...
...
...

Amannnnnnnn milletin işi gücü yok benimle mi uğraşacak(?)
(Bir kum tanesi hiçbirşeydir fakat milyonlarca kum tanesini birleştirince o hiçbirşeyden çok şey oluyor!  veri=>bilgi)


Hem zaman kaybını azaltmak hem de kafamızdaki soru işaretlerini gidermek için arka tarafta neler döndüğünü bildiğimiz uygulamaları kullanacağız.


Şimdi yukarıda,olanları görünce endişelenmeye başladım ve bu benim için bir problem oldu ama bu problemi nasıl çözebilirim ki ?


Soru şu;
Oluşturacağınız script'i aşağıdaki gibi kullandığımızda, youtube'dan aldığınız herhangi bir videoyu url parametresine verdiğinizde ,bu videoyu mp3 olarak indirsin.

```
.\youtube_mp3_donustur.ps1 -url video-linki

```



Not:Yukarıda,size fazla gelebilecek yerleri farkındalık oluşturmak için yazdım.

## Çözüm


**Youtube mp3 indirme probleminin çözümü için script kodları;**

```
param($url);

mkdir Download;
cd Download;

youtube-dl $url;

Get-ChildItem | % { $_.BaseName>>.\isim.txt; $_.Extension>>.\uzanti.txt }

$isim=Get-Content -Encoding UTF8 .\isim.txt;
$uzanti=Get-Content -Encoding UTF8 .\uzanti.txt;

ffmpeg -i ($isim+$uzanti)  ($isim+".mp3");

move .\*.mp3 ../
cd ../
Remove-Item .\Download -Recurse
```

## Kullanım

```
.\youtube_mp3_donustur.ps1 -url video-linki
```