<#

.SYNOPSIS
    PowerShell Base64 Encoding & Decoding


.DESCRIPTION
  PowerShell Base64 Encoding & Decoding 

  Kullanımı hakkında;
  Bir veriyi base64 ile kodlamak için 1,
  base64 ile kodlanmış veriyi çözmek içinse 2 seçeneğini kullanabilirsiniz.

  Örnek Kullanımlar

  Örnek-1)Bir veriyi base64 ile kodlamak
  PS C:\> .\PsBase64.ps1 -secim 1

  Örnek-2)Base64 ile kodlanmış veriyi çözmek
  PS C:\> .\PsBase64.ps1 -secim 2


.LINK
    https://github.com/mustafadalga/PS-base64

#>



param($secim);

if($secim -eq 1)
{
    $metin = Read-Host -Prompt "Kodlanacak metni giriniz";
    $Bytes = [System.Text.Encoding]::Unicode.GetBytes($metin);
    $KodlanmisMetin =[Convert]::ToBase64String($Bytes);
    $KodlanmisMetin;
}
elseif($secim -eq 2)
{
    $KodlanmisMetin=Read-Host -Prompt "Base64 ile kodlanmış veriyi giriniz";
    $CozulenMetin = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($KodlanmisMetin));
    $CozulenMetin;
}
else
{
    Write-Host "Lütfen geçerli bir seçim yapınız";
}

