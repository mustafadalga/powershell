param($url);


$dosya = New-Object System.Net.WebClient
[string]$isim=Get-Random;

$dosya.DownloadFile($url, ($isim+".jpg"));

Invoke-WebRequest $url -OutFile ($isim+".jpg")