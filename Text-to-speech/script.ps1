Add-Type -AssemblyName System.speech
$metin = New-Object System.Speech.Synthesis.SpeechSynthesizer

echo " "
echo "Seslendirme ile ilgili ayarlarınız yapılacak."
echo " "

Function SeslendirenKisiyiBelirle()
{
    if ($seslendirenKisi -eq "1")
    {
      $metin.SelectVoice('Microsoft David Desktop')
    }
    elseif($seslendirenKisi -eq "2")
    {
      $metin.SelectVoice('Microsoft Zira Desktop')
    }
}


$seslendirenKisi=Read-Host -Prompt "Seslendirmeyi yapacak kişiyi seçiniz(Erkek için 1 , Kadın için 2)"

if(($seslendirenKisi -eq "1") -or ($seslendirenKisi -eq "2"))
{
       SeslendirenKisiyiBelirle
}
else
{
    Do {
            echo " ";
            echo "******Geçersiz seçim! Lütfen geçerli bir seçim yapınız.******";
            echo " ";
            $seslendirenKisi=Read-Host -Prompt " Seslendirmeyi yapacak kişiyi seçiniz(Erkek için 1 , Kadın için 2)"
            
    }
    Until (($seslendirenKisi -eq '1') -or ($seslendirenKisi -eq '2'))
    SeslendirenKisiyiBelirle
}

Add-Member -InputObject $metin -MemberType ScriptMethod -Name "Seslendir" -Value {param($yazi); $metin.Speak($yazi); }

$Global:metin = $metin
echo " "
echo 'Seslendirme ayarlarınız yapıldı. Bir metni ya da kelimeyi seslendirmek için $metin.Seslendir("Metin ya da kelime ...") şeklinde kullanabilirsiniz.'
echo " " 
echo 'Örnek:'
echo '$metin.Seslendir("Powershell for pentester")'
echo " "    
    
       
