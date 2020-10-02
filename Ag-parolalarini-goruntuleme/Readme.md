# Tüm Wi-Fi Parolalarını Görüntüleme - Windows 10

Windows işletim sistemi, şimdiye kadar kullandığınız her Wi-Fi parolasını hatırlar. Bu ağlara bu şekilde yeniden bağlanır. Windows PC'nizde şimdiye kadar bağlandığınız herhangi bir ağın kayıtlı parolasını aşağıdaki adımları izleyerek görüntüleyebilirsiniz.


1.  Sisteminizdeki kayıtlı ağ profillerini listelemek için aşağıdaki komutu çalıştırın:

```
netsh wlan show profiles
```
![komut-1](https://user-images.githubusercontent.com/25087769/94960864-43299380-04fc-11eb-95a9-fb0d36d3fc2c.PNG)


2. Komut çıktısında yukarıdaki gibi bir liste olacaktır.Parolaya ihtiyacınız olan ağın adını bulun ve ardından aşağıdaki komutu çalıştırarak **"NetworkName"** yerine o ağın adını yazın

```
netsh wlan show profile name="NetworkName" key=clear
```

![komut-2](https://user-images.githubusercontent.com/25087769/94959943-ba5e2800-04fa-11eb-8ba5-8b1201ec2268.PNG)

Komut çıktısında *Güvenlik Ayarları(Security settings)* altındaki "Anahtar İçerik(Key Content)" alanında Wi-Fi ağ parolasını düz metin olarak görebilirsiniz.
