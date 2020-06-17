$smtpSunucusu = "smtp.gmail.com"
$smtpPort = "587" 

$gmail = new-object System.Net.Mail.SmtpClient($smtpSunucusu, $smtpPort)
$gmail.EnableSsl = $true
echo " "
echo "Gmail E-posta ayarlarýnýz yapýlacak."
echo " "
echo "Kullandýðýnýz Gmail adresini giriniz."
$Global:kullanici =  read-host

echo "Bu Gmail adresi için þifrenizi giriniz."
$sifre = $host.UI.ReadLineAsSecureString()
$gmail.credentials = new-object System.Net.NetworkCredential($kullanici, $sifre)
add-member -InputObject $gmail -MemberType ScriptMethod -Name "gonder" -Value {param($kime, $konu, $govde); $gmail.send($kullanici, $kime, $konu, $govde); echo "Mail gönderildi"; }

$Global:gmail = $gmail
echo " "
echo 'Mail ayarlarýnýz yapýldý. Mail gondermek için $gmail.gonder() komutunu kullanabilirsiniz.'
echo " "
echo 'Örnek:'
echo '$gmail.gonder("alici@adre.si", "konu", "govdemetni")'
echo " "