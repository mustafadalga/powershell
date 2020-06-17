# Set-Clipboard ve Get-Clipboard Komutlarının Kullanımı

## Set-Clipboard 

```Set-Clipboard``` Windows işletim sistemi üzerinde metin , resim , video , müzik veya herhangi bir şey'i panoya kopyalamak için kullanılan bir komuttur.Panoya kopyalanan resim , video , metin...  ```Get-Clipboard```  ile görüntülenebilir.

**Pano:** Her hangi bir yerden kopyalanan yada taşınan, başka bir alanda kullanmak için geçici bir depolama alanına denir. Metin yada grafiği seçerek daha sonra her hangi başka bir yere yapıştır komutu kullanılarak panoya taşıma veya kes kopyala yöntemidir.


Set-Clipboard komutunun aşağıdaki bazı parametreleri bulunmaktadır:

- -Value parametresi kopyalanacak metni seçmek için kullanılır.
- -Append parametresi kopyalanan metnin sonuna ekleme yapmak için kullanılır.
- -Path parametresi,bir dosyanın yolunu belirterek dosyanın kopyalanması için kullanılır.
- -Confirm parametresi kopyalama işlemini gerçekleştirmeden önce onay istemek için kullanılır.
- -WhatIf parametresi ise gerçekleşilen işlemin durumunu gösterir.


#### Örnek 1-)Bir metni panoya kopyalama


```
Set-Clipboard -Value "Bu yazıyı panoya kopyala"
```
Yukarıdaki yazının çıktısı panoya kopyalanmış oldu ve metin dosyasının yapıştırılabileceği herhangi bir yere yapıştırılabilir.


#### Örnek 2-)Daha önce kopyalanmış bir metnin sonuna ekleme yapma

```
 Set-Clipboard -Append "yeni yazı eklendi"
```

Yukarıdaki komut satırı ile en son kopyalanmış bir metnin sonuna ekleme yapıldı.


#### Örnek 3-)Dosya ya da klasörü panoya kopyalama

```
Set-Clipboard  -Path .\ , ..\BilgisayarSecimi.txt
```

Yukarıdaki komut satırı ile bir dosya ve bir klasörü panoya kopyalama işlemi gerçekleştirildi.



#### Örnek 4-) Bir dosyanın içeriğini panoya kopyalama

```
Get-Content -Path .\BilgisayarSecimi.txt | Set-Clipboard
```

Yukarıdaki  komutu satırı ile  ```BilgisayarSecimi.txt``` içeriği panoya kopyalanma işlemi gerçekleştirildi.



#### Örnek 5-)Bir komutunu çıktısını panoya kopyalama

```
whoami | Set-Clipboard
```

Yukarıdaki komut satırı ile oturum açan kullanının adını getirir.


Örnek 6-) Panoya kopyalanama işlemi gerçekleştirmeden önce onay isteme

Set-Clipboard -Value "Bu Yazı Panoya Alınacak"  -Confirm:$true


Yukarıdaki komut satırı ile panoya kopyalama işlemi gerçekleşmeden önce onay isteyecektir.


#### Örnek 7-) Panoya kopyalanma işlemi gerçekleşirken neler olduğunu-adımlarını görme

```
Set-Clipboard -Value "Bu Yazı Panoya Alınacak" -WhatIf
```


## Get-Clipboard

Windows işletim sistemi üzerinde,panoya kopyalanmış resimleri , yazıları , dosyaları veya panoya kopyalanmış herhangi bir şey'i görmek için kullanılan bir komuttur.

#### Örnek 1-)Herhangi bir yerden kopyalanmış metni görelim.

```
Get-Clipboard
```


Yukarıdaki komut ile en son kopyaladığımız metni getirmiş olduk.

```
İyi bir çiftçi ekinini ihmal eder mi?
İyi bir oğretmen en aptal oğrenciye bile kotu davranır mı?
İyi bir baba bir çocuğunu açlığa makhum eder mi?
İyi bir pogramcı programının bakımını yapmayı reddeder mi?
```

```Get-Clipboard``` komutu varsayılan olarak Text formatında çalışır.Yani sadece kopyalanan metinleri görüntüler.
Kopyalanmış resim , video veya müzik  dosyalarını görmek için de , ```-Format``` parametresi kullanılır.

```-Format``` parametresinin aldığı değerler şöyledir;

- **Text:** Kopyalanmış metinleri getirir.
- **FileDropList:** Kopyalanmış dosyaları getirir(resim , video , müzik , uygulama , word belgesi...)
- **Image:** Kopyalanmış resim dosyalarını getirir.
- **Audio:** Kopyalanmış ses dosyalarını getirir.



#### Örnek 2-)Kopyalanmış dosyaları görelim.

```
Get-Clipboard -Format FileDropList
```

**Çıktısı **

```
Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----        2.12.2018     12:32        9199355 Extremely Rare All Black Penguin Sighting - Dynasties- Behind The Scenes - BBC Earth.MP4
-a----       28.01.2018     20:56            424 fuzzer.py
-a----        2.12.2018     14:27      139003593 Habitat For Lion-ity - Building A Shade Platform For Rescued BIG CATS Lion Enrichment.MP4
-a----       10.04.2018     21:27            520 riskli_php_fonksiyonları.php
-a----       27.01.2018     16:24              0 ssh telnet base64 kavramları.txt
-a----        5.03.2018     15:54           1620 TCP.txt
-a----        2.12.2018     13:56       85317195 The Cheetah - Big Cat Tales- More from the Mara Region.MP4
-a----        2.12.2018     14:03       87060104 The Lion - Big Cat Tales- More from the Mara Region.MP4
-a----        9.04.2018     19:39            957 Web-pentest.txt
```

Yukarıdaki komut ile en son kopyalanmış dosyaları getirdik.