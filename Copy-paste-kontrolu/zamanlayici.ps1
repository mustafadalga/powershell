$dizin=Get-Location
$yol="$dizin\logAl.ps1";
$saat= New-ScheduledTaskTrigger -Once -At "06/17/2020 22:15 PM"
$uygulama= New-ScheduledTaskAction -Execute "PowerShell.exe"  -Argument "-executionpolicy bypass -NoExit -noprofile -WindowStyle Hidden -file $yol" 
Register-ScheduledTask -TaskName Gorev -Trigger $saat -Action $uygulama -RunLevel Highest -Force



#Sýnavýn saat 15:00 baþladýðýný kabul ettiðim için uygulamayý bu saatte calýstýrdým.Tarih seçimi olarak ay gün ve yýl olarak seçilmiþ .kullandýðým bilgisayar ingilizce dilinde .Türkce #dildeki iþletim sistemlerinde nasýl olduðnu denemediðim için bilgim yok.