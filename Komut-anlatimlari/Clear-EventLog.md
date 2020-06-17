# Sistem Günlüğünü Temizleme

Bilgisayar güç tuşuna basıp bilgisayarı açıp bilgisayarınızı kapattığınız sürece kadar yapılan bütün işlemler kayıt altına alınmaktadır.Bu kayıtlara ise log layıtları denilmektedir.(Bir nevi günlük gibi düşünebilirsiniz.)

Çeşitli sebeplerden dolayı bu kayıtları , geçmişi silmek isteyebiliriz.Bu işlemleri , Powershell'in ```Clear-EventLog``` adlı özelliğini kullanarak gerçekleştirebiliriz.

**Not:** ```Clear-EventLog``` kullanmak için powershell'i yönetici olarak çalıştırmanız gerekiyor.

Bilgisayar-sistem 8 farklı kategori de sistem günlüğü(log kaydı)  tutmaktadır.Bunları görmek için aşağıdaki gibi komutu kullanabilirsiniz.

```
Get-EventLog -List
```

Sonuç olarak aşağıdaki gibi bir görüntü çıkacaktır.

```
  Max(K) Retain OverflowAction        Entries Log
  ------ ------ --------------        ------- ---
  20.480      0 OverwriteAsNeeded           0 Application
  20.480      0 OverwriteAsNeeded           0 HardwareEvents
     512      7 OverwriteOlder              0 Internet Explorer
  20.480      0 OverwriteAsNeeded           0 Key Management Service
     128      0 OverwriteAsNeeded           0 OAlerts
  20.480      0 OverwriteAsNeeded           3 Security
  20.480      0 OverwriteAsNeeded           2 System
  15.360      0 OverwriteAsNeeded           0 Windows PowerShell
```

Bunların içerisinden örnek olarak  Powershell'in sistemin günlüğünü silelim .Bu işlemi gerçekleştirmek için aşağıdaki gibi bir komut kullanılabilir.

```
Clear-EventLog "Windows PowerShell"
```

Bu komut, yerel bilgisayardaki Windows PowerShell olay günlüğünden girdileri temizler.