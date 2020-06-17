# Geçerli Powershell Oturumunu Kaydetme


Powershell , yönetici olarak varsayılan olarak ```PS C:\WINDOWS\system32>``` dizinin de açılmaktadır ve üzerinde işlem yaptığımız dizine gitmek için her seferinde cd komutunu kullanırız.

Her seferinde böyle yapmaktansa Powershell'in bir özelliğini kullanarak Powershell oturumunu kaydedip , powershell'i  tekrardan çalıştığımız dizinde açabiliriz.


```Export-Console```, üzerinde çalıştığımız powershell terminalinin bilgilerini ```.psc1``` uzantılı olark dışa aktarılmasını sağlar.Böylece her Powershell ekranını açtığımızda, cd komutunu kullanıp çalıştığımız klasöre gitmeye gerek kalmadan , dışa aktarılan dosya sayesinde çalıştığımız dizinden çalışmaya devam edebiliriz.

#### Kullanımı ;

```
Export-Console -Path .\oturum1.psc1
```

Yukarıdaki komut ile çalıştığım Powershell oturumunu ```oturum.psc1``` adında, bulunduğum klasöre kaydettim.
Bu kaydedilen dosyayı çalıştırdığımda powershell,kaydedilen oturumun dizin adresi nerede ise oradan çalışmaya başlar.


**Not:**powershell oturumunu istediğiniz herhangi bir yere kaydedebilirsiniz.
