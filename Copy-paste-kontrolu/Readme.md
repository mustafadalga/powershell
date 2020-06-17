# Sınav Esnasında Copy/Paste Kontrolü Yapma

## Problem 

İşletim Sistemleri dersinin finalinde öğrenciler uygulamalı bir sınava girecektir.Öğrencilerin sınava gireceği bilgisayarlarda Windows 8 işletim sistemi yüklüdür.

3 Lab'daki 55 adet bilgisayara ait 55 adet IP adresi, **ipler.txt** adlı dosyada muhafaza edilmiştir ve dosyanın her satırında bir ip adresi bulunmaktadır.

Final sınavı 4 Ocak 2019 günü saat 15:00'de gerçekleşecektir.

Bir hoca olarak ben Lab'larda öğrencilerin hangi cevapları "copy/paste" yöntemi ile cevapladıklarını bilmek istiyorum. Örneğin, açıklama gerektiren soruları olduğu gibi **Wikipedia**'dan vs. alan öğrenci olup olmadığını bilmek istiyorum.

Bu nedenle aşağıdaki gibi bir çözüm geliştirdim.

Labların tümündeki bilgisayarlarda kullanıcı oturum açtığında etkinleşecek öyle bir zamanlanmış görevim olsun ki, eğer günlerden 4 Ocak 2019 ise ve saat 14:30 ila 15:30 arasındaysa bir arkaplan işi başlatılsın. Ta ki bilgisayar kapatılana kadar sürecek bu arkaplan işi, sınavda bulunan öğrencinin kullanmakta olduğu bilgisayarda her 2 saniyede bir clipboard panosu (ctrl + c ile metinleri kopyaladığımız görünmez pano) içeriğini ev dizinindeki \Documents dizini altında yer alan **[ip-adresi]-clipboard.txt** isimli gizli bir dosyanın içerisine satır satır yazdırsın.

**[ip-adresi]** ibaresi yerine öğrencinin kullandığı bilgisayarın ip adresi gelmelidir.

Bu sayede, sınav sonunda **[ip-adresi]-mesajpanosu.txt** isimli metin dosyalarını toplayarak ve hangi öğrenci sınavda ctrl+c ile hangi veriyi kopyalamış görebileceğim.

Bu çözümü nasıl uygulayabilirim?


## Çözüm

Problemin çözümü için 2 script kullandım.

 1. Birinci script görev zamanlayıcısını başlatmak için,
 2. İkinci script ise log kaydı tutmak için kullanılacaktır.


Sınavın yapılacağı tarihte log kaydını almak için kullanacağım script dosyasını, öğrencinin görmeyeceği bir şekilde , arka planda gizli bir şekilde çalıştıracağım.Sınavın bittiği saatte ise script log kaydı almayı durduracak.


### Görev zamanlayıcı scripti için;

 Görev zamanlayıcı ve log almak için kullanılan 2 scriptte aynı klasörde bulunuyor.
 
 1. ```logAl.ps1``` dosyasını çalıştırabilmem için scriptin bulunduğunu dizin adresini alıp ```$dizin``` adlı değişkene attım.
 2. Scriptin tam yolunu belirleyip $yol değişkenine attım.
 3. Script'in ```logAl.ps1``` script'in çalıştırılacağı gün ve saati seçip ```$saat``` adlı değişkene attım.
 4. Belirlediğim gün ve saat geldiğinde hangi uygulamanın çalıştırılağını belirleyip ```$uygulama``` adlı değişkene attım.
   ```-WindowStyle Hidden``` parametresi ile log kaydı alan script'in gizli bir şekilde çalışmasını sağladım.
   ```-file $yol```  parametresi ile powershell üzerinde çalışacak olan scriptin adresini belirledim.
 5-)Gün ve tarihi belirleyip çalıştırılacak script'i belirledikten sonra ```Register-ScheduledTask``` ile zamanlanmış görev ayarlayıp değişkenleri yerlerine yazdım. Çeşitli hataların önüne geçmek için zamanlanmış görevi ```-RunLevel Highest -Force``` parametrelerini kullandım.


 **NOT:** Sınavın saat 15:00 başladığını kabul ettiğim için uygulamayı bu saatte calıstırdım.Tarih seçimi olarak ay/gün/yıl formatında ayarladım.Kullandığım bilgisayarın dili ingilizce ve tarih ayarlaması böyle tanımlanıyor.

```
$dizin=Get-Location
$yol="$dizin\logAl.ps1";
$saat= New-ScheduledTaskTrigger -Once -At "01/04/2019 15:00 PM"
$uygulama= New-ScheduledTaskAction -Execute "PowerShell.exe"  -Argument "-executionpolicy bypass -NoExit -noprofile -WindowStyle Hidden -file $yol" 
Register-ScheduledTask -TaskName Gorev -Trigger $saat -Action $uygulama -RunLevel Highest -Force
```

### Sınav esnasında log kaydı tutmak için kullanılan script için;

 1. Log kayıtlarının tutulacağı txt dosyasının isminde, kullanılan bilgisayarın ip adresi de bulunacağı için bilgisayarın ip adresini alıp ```$ip``` değişkenine attım
 2. Log kayıtlarının tutulacağı dosyanın ismini belirleyip ```$dosyaAdi``` değişkenine attım.
 3. Problem de log kayıtlarının tutulacağı txt dosyasının bilgisayardaki Documents dizininde olması gerektiğini belirtilmiş.```cd``` komutu ile belirtilen dizine geçiş yaptım.
 4. ```Test-path``` komutu ile ```$dosyaAdi``` değişkenindeki dosya isminin olup olmadığını kontrol ettim.Eğer bu isimde bir dosya yoksa yeni bir dosya oluşturup dosyayı gizledim.```Test-path``` ile dosya kontrolü yapmamın sebebi , script'in 2.kullanımında oluşacak hataların önüne geçmektir.
 5. While döngüsünün içerisinde,her 2 saniye de 1 clipboard panosunu oluşturduğum txt dosyasının içerisine yazdırdım.Aynı zaman da if kontrol yapısını kullanarak saat kontrolünü yaptım.Saatin 17:00 olması durumunda script çalışması durdurup log almayı kesecektir ve gizli bir şekilde açılmış olan Powershell penceresi kapanacaktır. ```$PID``` değişkeni , Powershell'in o anki process'ini getirir.

```
$ip=(Test-Connection -ComputerName $env:computername -count 1).IPV4Address.ipaddressTOstring 

$dosyaAdi="$ip-clipboard.txt";

cd 	"~\Documents";


if(!(Test-Path $dosyaAdi))
{
    ni $dosyaAdi  -Type file
    $gizle=get-item $dosyaAdi -Force
    $gizle.attributes="Hidden"
}

while($true)
{
    Start-Sleep 2;
    Get-Clipboard >> $dosyaAdi;

    if("17:00" -eq (Get-Date -UFormat %R))
    {
        Stop-Process -Id $PID;
    }
}
```
