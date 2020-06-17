# Karışık Masaüstü

## Problem

Hazırladığım masaüstü temizleyicisi scriptim ile, masaüstümde yer alan jpg, png, pdf, docx gibi çeşitli uzantılara sahip belgelerimi uygun klasörlerin içine tasnif ettim. Ama masaüstümde hala bu kategorilere uymayan zibil gibi dosya barındırıyor. Kısayollar, çeşitli ziplenmiş dosyalar, diğer türden şeyler, ve saire...

Belgelerim kaldırıldıktan sonra geriye kalan bu dağınıklığı daha da toparlamak için, içerisinde çalıştırıldığı dizinde, son erişim zamanının üzerinden 3 ay geçmiş olan ve "sistem dosyası" ya da "klasör" kategorisinde yer almayan tüm dosyaları silecek, ama bunu yaparken "bu dosyayı sileceğim, onaylıyor musun" diye soracak bir script yazmak istiyorum. nasıl yapabilirim?


## Çözüm

Problemin çözümü için kullanılabilecek script kodları

```
$masaustuYol = [Environment]::GetFolderPath("Desktop");

mkdir $masaustuYol\BELGELER
mkdir $masaustuYol\RESİMLER
mkdir $masaustuYol\ViDEO
mkdir $masaustuYol\Mp3
mkdir $masaustuYol\HTML

Move-Item -Path $masaustuYol\*.pdf -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.docx -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.xlsx -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.pptx -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.txt -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.bat -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.ps1 -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.jpg -Destination $masaustuYol\RESİMLER
Move-Item -Path $masaustuYol\*.png -Destination $masaustuYol\RESİMLER
Move-Item -Path $masaustuYol\*.jpeg -Destination $masaustuYol\RESİMLER
Move-Item -Path $masaustuYol\*.mpeg -Destination $masaustuYol\ViDEO
Move-Item -Path $masaustuYol\*.mp4 -Destination $masaustuYol\ViDEO
Move-Item -Path $masaustuYol\*.mpg -Destination $masaustuYol\ViDEO
Move-Item -Path $masaustuYol\*.mpeg -Destination $masaustuYol\ViDEO
Move-Item -Path $masaustuYol\*.avi -Destination $masaustuYol\ViDEO
Move-Item -Path $masaustuYol\*.mp3 -Destination $masaustuYol\Mp3
Move-Item -Path $masaustuYol\*.html -Destination $masaustuYol\HTML

Get-ChildItem -Attributes !System –Path $masaustuYol\*.*  | Where-Object {($_.LastAccessTime -lt (Get-Date).AddDays(-90))} | Remove-Item -Confirm:$true

```

Kullanılan komutların ne işe yaradığını aşağıda açıklayacağım.


Masaüstü üzerinden işlem yapacağımız için her bilgisayar ortamının masaüstü adresini almak için aşağıdaki gibi bir kod kullandım.

```
$masaustuYol = [Environment]::GetFolderPath("Desktop");
```


Masaüstündeki resimleri , videoları , belgeleri , müzikleri ve html dosyalarını toparlamak için öncelikle bu dosya türleri ilgili klasörler oluşturdum.

```
mkdir $masaustuYol\BELGELER
mkdir $masaustuYol\RESİMLER
mkdir $masaustuYol\ViDEO
mkdir $masaustuYol\Mp3
mkdir $masaustuYol\HTML
```

Aşağıdaki kod parçaları ile de ilgili dosyaları kendi klasörlerine taşıdım.

```
Move-Item -Path $masaustuYol\*.pdf -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.docx -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.xlsx -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.pptx -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.txt -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.bat -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.ps1 -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.jpg -Destination $masaustuYol\RESİMLER
Move-Item -Path $masaustuYol\*.png -Destination $masaustuYol\RESİMLER
Move-Item -Path $masaustuYol\*.jpeg -Destination $masaustuYol\RESİMLER
Move-Item -Path $masaustuYol\*.mpeg -Destination $masaustuYol\ViDEO
Move-Item -Path $masaustuYol\*.mp4 -Destination $masaustuYol\ViDEO
Move-Item -Path $masaustuYol\*.mpg -Destination $masaustuYol\ViDEO
Move-Item -Path $masaustuYol\*.mpeg -Destination $masaustuYol\ViDEO
Move-Item -Path $masaustuYol\*.avi -Destination $masaustuYol\ViDEO
Move-Item -Path $masaustuYol\*.mp3 -Destination $masaustuYol\Mp3
Move-Item -Path $masaustuYol\*.html -Destination $masaustuYol\HTML
```


Masaüstündeki belirli dosya uzantıları ilgili klasörlere taşındıktan sonra kalan dosyalar üzerinden işlem yapacağım.

Masaüstünde sistem dosyası olmayan dosyaları listelemek istediğim için  ```-Attributes !System``` modunu kullandım. Problem de sadece dosyalar üzerinden işlem yapılmasını istediği için  ```–Path $masaustuYol\*.*```  ile sadece dosyaları listeliyorum.

```System``` dosyası olmayan tüm dosyaları listeledikten sonra ,son erişim zamanı 90 gün ya da daha fazla olanları silmek içinse ```$_.LastAccessTime``` Son erişim zamanı fonksiyonunu kullanarak 
 ```(Get-Date).AddDays(-90)``` özelliği ile -90 değerini girerek son erişim zamanı 3 ay ya da geçmiş olan dosyaları listeliyorum.



```Remove-Item``` ile listelenmiş dosyaları siliyorum. ```Remove-Item ```sonunda kullanılan ```-Confirm``` parametresi ile silmeden sonra onay istemek için kullanılır.

```
Get-ChildItem -Attributes !System –Path $masaustuYol\*.*  | Where-Object {($_.LastAccessTime -lt (Get-Date).AddDays(-90))} | Remove-Item -Confirm:$true
```
