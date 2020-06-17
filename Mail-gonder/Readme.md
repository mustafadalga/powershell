# Powershell kullanarak gmail sunucusu üzerinden gmail gönderme


**Not:** Gmail üzerinden mail gönderebilmek için hesabınızın [Daha az güvenli uygulama erişimi](https://myaccount.google.com/lesssecureapps)'ni açmalısınız ve ayarlardan yönlendirme ve POP/ IMAP ayarları etkinleştirilmelidir.


### Kodlar 

```
$smtpSunucusu = "smtp.gmail.com"
$smtpPort = "587" 

$gmail = new-object System.Net.Mail.SmtpClient($smtpSunucusu, $smtpPort)
$gmail.EnableSsl = $true
echo " "
echo "Gmail E-posta ayarlarınız yapılacak."
echo " "
echo "Kullandığınız Gmail adresini giriniz."
$Global:kullanici =  read-host

echo "Bu Gmail adresi için şifrenizi giriniz."
$sifre = $host.UI.ReadLineAsSecureString()
$gmail.credentials = new-object System.Net.NetworkCredential($kullanici, $sifre)
add-member -InputObject $gmail -MemberType ScriptMethod -Name "gonder" -Value {param($kime, $konu, $govde); $gmail.send($kullanici, $kime, $konu, $govde); echo "Mail gönderildi"; }

$Global:gmail = $gmail
echo " "
echo 'Mail ayarlarınız yapıldı. Mail gondermek için $gmail.gonder() komutunu kullanabilirsiniz.'
echo " "
echo 'Örnek:'
echo '$gmail.gonder("alici@adre.si", "konu", "govdemetni")'
echo " "
```
