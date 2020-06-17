# Dosya Sıkıştırma

Bir veya birden fazla dosyayı kullanılan algoritmayla birlikte daha küçük boyuta indirgeme işlemine sıkıştırma denir. 

Sıkıştırma sayesinde dosyaların disk üzerinde kapladığı boyutu düşürülür. Olduğundan daha küçük boyuta indirgenen dosyalar daha kolay indirilebilir, paylaşılabilir ve gönderilebilir  hale gelirler. Böylece kullanıcılar hem zamandan hem internet kaynaklarından hem de depolama alanından tasarruf edebilirler.


Dosya sıkıştırma işlemini Powershell'in ```Compress-Archive``` özelliğini kullanarak yapabiliriz.

**Compress-Archive:** Belirtilen dosya ve klasörlerden bir arşiv veya sıkıştırılmış dosya oluşturur.

```Compress-Archive``` komutunun kullanımına geçmeden önce bir kaç alt parametrelerini açıklayalım.

- ```-Path``` adlı parametre ile sıkıştırılacak dosya ya da klasörler seçilir.
- ```-CompressionLevel```,arşiv dosyasını oluştururken ne kadar sıkıştırmanın uygulanacağını belirtir.

<hr>

 **```-CompressionLevel``` parametresi için kullanılan değerler:**

**Fastest:** İşlem süresini azaltmak için mevcut en hızlı sıkıştırma yöntemini kullanır; Bu daha büyük dosya boyutlarına neden olabilir.
**Optimal:** İşleme süresi dosya boyutuna bağlıdır.

Eğer parametre belirtilmezse, komut varsayılan değer olan ```Optimal```'i kullanır.



#### Örnek 1:Sadece dosya sıkıştırma

```
Compress-Archive -Path .\1.jpg,.\2.jpg,.\3.jpg,.\4.jpg,.\5.jpg, -CompressionLevel Optimal -DestinationPath .\arsivim.zip
```

Yukarıdaki komut satırı ile, seçilen 5 resim dosyası arsivim.zip adıyla sıkıştırıldı.

#### Örnek 2:Dosya ve resim sıkıştırma

```
Compress-Archive -Path .\1.jpg,.\2.jpg,.\3.jpg,.\4.jpg,.\5.jpg,.\resimler\ -CompressionLevel Optimal -DestinationPath .\arsivim.zip
```

Yukarıdaki Komut ile seçilen 5 resim dosyası ve resimler adlı klasör sıkıştırıldı.

#### Örnek 3: Mevcut bir arşiv dosyasını güncelleme

```
Compress-Archive -Path yeniresim.jpg , yeniresimler -CompressionLevel Optimal -DestinationPath arsivim.zip
```

Yukarıdaki komut ile mevcut bir arsiv dosyasına yeni bir resim ve klasör eklendi.