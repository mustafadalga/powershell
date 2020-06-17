# Her Öğrenciye 5 Komut

## Problem 

Elimde iki adet .txt uzantılı dosya var. Birinin her satırında, bu sene İşletim Sistemleri dersimizi alan öğrencilerden birinin ismi var. ogrenciler.txt isimli dosyamın içeriği şöyle:

```
Delores Sharpe
Vinnie Welch
Tania Howe
Kevin Williamson
Junayd Christie
Wesley Chaney
Aniela Farrow
Klay Cuevas
Abby Frame
Abdullahi Payne
Johnathan Hutton
Elis Middleton
Branden Webb
Cali Winters
Allana Chambers
Aiyla Holt
Celia West
Corrina Reyna
Stacey Hines
Aayush Bautista
Danni Walton
Dexter Vazquez
Mahir Amin
Suman Ortega
Derry Knott
Charlotte Hilton
Vincenzo Bate
Ayse Jennings
Jasleen Cope
Caitlyn Esparza
Brennan Knight
Barbara Mclaughlin
Zeenat Santiago
Rodney Rahman
Evie-Grace Wu
Cieran Garrison
Roshan Scott
Ezekiel Hackett
Shanon Glover
Leanna David
Emmeline Cote
Mariyah Downes
Mark Cota
Dayna Price
Efan Fellows
Clarissa Holder
Marwa Pemberton
Sannah Conway
Nieve Hendricks
Guy Solomon
```

Başka bir dosya olan komutlar.txt'nin her satırında ise, powershell'de kullanabileceğimiz komutlardan biri yer alıyor. Toplamda dosya, bu powershell denen şeyin içerisinde kullanabileceğimiz tüm komutların bir listesi. Bu dosyanın içeriği de şu şekilde:

```
Add-BitsFile
Add-Computer
Add-Content
Add-History
Add-JobTrigger
Add-Member
Add-PSSnapin
Add-Type
Checkpoint-Computer
Clear-Content
Clear-EventLog
Clear-History
Clear-Item
Clear-ItemProperty
Clear-Recyclebin
Clear-Variable
Compare-Object
Complete-BitsTransfer
Complete-Transaction
Compress-Archive
Configuration
Connect-PSSession
Connect-WSMan
Convert-Path
Convert-String
ConvertFrom-Csv
ConvertFrom-Json
ConvertFrom-SddlString
ConvertFrom-SecureString
ConvertFrom-String
ConvertFrom-StringData
ConvertTo-Csv
ConvertTo-Html
ConvertTo-Json
ConvertTo-SecureString
ConvertTo-Xml
Copy-Item
Copy-ItemProperty
Debug-Job
Debug-Process
Debug-Runspace
Disable-ComputerRestore
Disable-DscDebug
Disable-JobTrigger
Disable-NetworkSwitchEthernetPort
Disable-NetworkSwitchFeature
Disable-NetworkSwitchVlan
Disable-PSBreakpoint
Disable-PSRemoting
Disable-PSSessionConfiguration
Disable-PSTrace
Disable-PSWSManCombinedTrace
Disable-RunspaceDebug
Disable-ScheduledJob
Disable-WSManCredSSP
Disable-WSManTrace
Disconnect-PSSession
Disconnect-WSMan
Enable-ComputerRestore
Enable-DscDebug
Enable-JobTrigger
Enable-NetworkSwitchEthernetPort
Enable-NetworkSwitchFeature
Enable-NetworkSwitchVlan
Enable-PSBreakpoint
Enable-PSRemoting
Enable-PSSessionConfiguration
Enable-PSTrace
Enable-PSWSManCombinedTrace
Enable-RunspaceDebug
Enable-ScheduledJob
Enable-WSManCredSSP
Enable-WSManTrace
Enter-PSHostProcess
Enter-PSSession
Exit-PSHostProcess
Exit-PSSession
Expand-Archive
Export-Alias
Export-BinaryMiLog
Export-Clixml
Export-Console
Export-Counter
Export-Csv
Export-FormatData
Export-ModuleMember
Export-ODataEndpointProxy
Export-PSSession
Find-DscResource
Find-Module
Find-Package
Find-PackageProvider
Find-Script
ForEach-Object
Format-Custom
Format-Hex
Format-List
Format-Table
Format-Wide
Get-Acl
Get-Alias
Get-AppLockerFileInformation
Get-AppLockerPolicy
Get-AuthenticodeSignature
Get-BitsTransfer
Get-ChildItem
Get-CimAssociatedInstance
Get-CimClass
Get-CimInstance
Get-CimSession
Get-Clipboard
Get-CmsMessage
Get-Command
Get-ComputerRestorePoint
Get-Content
Get-ControlPanelItem
Get-Counter
Get-Credential
Get-Culture
Get-Date
Get-DscConfiguration
Get-DscConfigurationStatus
Get-DscLocalConfigurationManager
Get-DscResource
Get-Event
Get-EventLog
Get-EventSubscriber
Get-ExecutionPolicy
Get-FileHash
Get-FormatData
Get-Help
Get-History
Get-Host
Get-HotFix
Get-InstalledModule
Get-InstalledScript
Get-IseSnippet
Get-Item
Get-ItemProperty
Get-ItemPropertyValue
Get-Job
Get-JobTrigger
Get-Location
Get-LogProperties
Get-Member
Get-Module
Get-NetworkSwitchEthernetPort
Get-NetworkSwitchFeature
Get-NetworkSwitchGlobalData
Get-NetworkSwitchVlan
Get-PSBreakpoint
Get-PSCallStack
Get-PSDrive
Get-PSHostProcessInfo
Get-PSProvider
Get-PSRepository
Get-PSSession
Get-PSSessionCapability
Get-PSSessionConfiguration
Get-PSSnapin
Get-Package
Get-PackageProvider
Get-PackageSource
Get-PfxCertificate
Get-Process
Get-Random
Get-Runspace
Get-RunspaceDebug
Get-ScheduledJob
Get-ScheduledJobOption
Get-Service
Get-TraceSource
Get-Transaction
Get-TroubleshootingPack
Get-TypeData
Get-UICulture
Get-Unique
Get-Variable
Get-WSManCredSSP
Get-WSManInstance
Get-WinEvent
Get-WmiObject
Group-Object
Import-Alias
Import-BinaryMiLog
Import-Clixml
Import-Counter
Import-Csv
Import-IseSnippet
Import-LocalizedData
Import-Module
Import-PSSession
Import-PackageProvider
Import-PowerShellDataFile
Install-Module
Install-Package
Install-PackageProvider
Install-Script
Invoke-AsWorkflow
Invoke-CimMethod
Invoke-Command
Invoke-DscResource
Invoke-Expression
Invoke-History
Invoke-Item
Invoke-RestMethod
Invoke-TroubleshootingPack
Invoke-WSManAction
Invoke-WebRequest
Invoke-WmiMethod
Join-Path
Limit-EventLog
Measure-Command
Measure-Object
Move-Item
Move-ItemProperty
New-Alias
New-AppLockerPolicy
New-CimInstance
New-CimSession
New-CimSessionOption
New-DscChecksum
New-Event
New-EventLog
New-Guid
New-IseSnippet
New-Item
New-ItemProperty
New-JobTrigger
New-Module
New-ModuleManifest
New-NetworkSwitchVlan
New-Object
New-PSDrive
New-PSRoleCapabilityFile
New-PSSession
New-PSSessionConfigurationFile
New-PSSessionOption
New-PSTransportOption
New-PSWorkflowExecutionOption
New-PSWorkflowSession
New-ScheduledJobOption
New-ScriptFileInfo
New-Service
New-TemporaryFile
New-TimeSpan
New-Variable
New-WSManInstance
New-WSManSessionOption
New-WebServiceProxy
New-WinEvent
Out-Default
Out-File
Out-GridView
Out-Host
Out-Null
Out-Printer
Out-String
Pop-Location
Protect-CmsMessage
Publish-DscConfiguration
Publish-Module
Publish-Script
Push-Location
Read-Host
Receive-Job
Receive-PSSession
Register-ArgumentCompleter
Register-CimIndicationEvent
Register-EngineEvent
Register-ObjectEvent
Register-PSRepository
Register-PSSessionConfiguration
Register-PackageSource
Register-ScheduledJob
Register-WmiEvent
Remove-BitsTransfer
Remove-CimInstance
Remove-CimSession
Remove-Computer
Remove-DscConfigurationDocument
Remove-Event
Remove-EventLog
Remove-Item
Remove-ItemProperty
Remove-Job
Remove-JobTrigger
Remove-Module
Remove-NetworkSwitchEthernetPortIPAddress
Remove-NetworkSwitchVlan
Remove-PSBreakpoint
Remove-PSDrive
Remove-PSSession
Remove-PSSnapin
Remove-TypeData
Remove-Variable
Remove-WSManInstance
Remove-WmiObject
Rename-Computer
Rename-Item
Rename-ItemProperty
Reset-ComputerMachinePassword
Resolve-Path
Restart-Computer
Restart-Service
Restore-Computer
Restore-DscConfiguration
Restore-NetworkSwitchConfiguration
Resume-BitsTransfer
Resume-Job
Resume-Service
Save-Help
Save-Module
Save-NetworkSwitchConfiguration
Save-Package
Save-Script
Select-Object
Select-String
Select-Xml
Send-MailMessage
Set-Acl
Set-Alias
Set-AppLockerPolicy
Set-AuthenticodeSignature
Set-BitsTransfer
Set-CimInstance
Set-Clipboard
Set-Content
Set-Date
Set-DscLocalConfigurationManager
Set-ExecutionPolicy
Set-Item
Set-ItemProperty
Set-JobTrigger
Set-Location
Set-LogProperties
Set-NetworkSwitchEthernetPortIPAddress
Set-NetworkSwitchPortMode
Set-NetworkSwitchPortProperty
Set-NetworkSwitchVlanProperty
Set-PSBreakpoint
Set-PSDebug
Set-PSRepository
Set-PSSessionConfiguration
Set-PackageSource
Set-ScheduledJob
Set-ScheduledJobOption
Set-Service
Set-StrictMode
Set-TraceSource
Set-Variable
Set-WSManInstance
Set-WSManQuickConfig
Set-WmiInstance
Show-Command
Show-ControlPanelItem
Show-EventLog
Sort-Object
Split-Path
Start-BitsTransfer
Start-DscConfiguration
Start-Job
Start-Process
Start-Service
Start-Sleep
Start-Trace
Start-Transaction
Start-Transcript
Stop-Computer
Stop-DscConfiguration
Stop-Job
Stop-Process
Stop-Service
Stop-Trace
Stop-Transcript
Suspend-BitsTransfer
Suspend-Job
Suspend-Service
Tee-Object
Test-AppLockerPolicy
Test-ComputerSecureChannel
Test-Connection
Test-DscConfiguration
Test-ModuleManifest
Test-PSSessionConfigurationFile
Test-Path
Test-ScriptFileInfo
Test-WSMan
Trace-Command
Unblock-File
Undo-Transaction
Uninstall-Module
Uninstall-Package
Uninstall-Script
Unprotect-CmsMessage
Unregister-Event
Unregister-PSRepository
Unregister-PSSessionConfiguration
Unregister-PackageSource
Unregister-ScheduledJob
Update-DscConfiguration
Update-DscConfiguration
Update-FormatData
Update-Help
Update-List
Update-Module
Update-ModuleManifest
Update-Script
Update-ScriptFileInfo
Update-TypeData
Use-Transaction
Wait-Debugger
Wait-Event
Wait-Job
Wait-Process
Where-Object
Write-Debug
Write-Error
Write-EventLog
Write-Host
Write-Information
Write-Output
Write-Progress
Write-Verbose
Write-Warning 
```

Bu dersi alan ve ogrenciler.txt'de listelenmiş öğrencilerin her birine şöyle bir ödev vermek istiyorum: Her öğrenci, kendisi için komutlar.txt dosyasından rastgele seçilmiş 5 tane komutun her biri ile ilgili birer kullanım kılavuzu hazırlayacak.

Öğrencilere bu ödevi verebilmek için, hangi öğrenciye hangi rastgele seçilmiş 5 komutun tahsis edildiğini gösteren şu şekilde bir ilan tablosu hazırlamam gerekiyor:


| Öğrenci Adı  | Kılavuz Hazırlayacağı Komutlar |
| ------------- | ------------- |
| Öğrenci1  | RastgeleKomut1, RastgeleKomut2, RastgeleKomut3,  RastgeleKomut4, RastgeleKomut5,  |
| Öğrenci2  | RastgeleKomut1, RastgeleKomut2, RastgeleKomut3,  RastgeleKomut4, RastgeleKomut5,  |
| Öğrenci3  | RastgeleKomut1, RastgeleKomut2, RastgeleKomut3,  RastgeleKomut4, RastgeleKomut5,  |
| Öğrenci4  | RastgeleKomut1, RastgeleKomut2, RastgeleKomut3,  RastgeleKomut4, RastgeleKomut5,  |
| Öğrenci5  | RastgeleKomut1, RastgeleKomut2, RastgeleKomut3,  RastgeleKomut4, RastgeleKomut5,  |
...         | .. | 




ogrenciler.txt ve komutlar.txt'deki bilgileri kullanacak bu tabloyu nasıl oluşturabilirim ?

## Çözüm

Her öğrenciye 5 komut probleminin çözümü için script kodları;

```
$ogrenciSayisi=(Get-Content .\ogrenciler.txt | Measure-Object –Line).Lines; 
cp .\komutlar.txt .\yedekKomutListesi.txt    
ni .\tablo.txt;                              
ni .\secilenkomutlar.txt;                   


echo "Öğrenci Adı                                           Kılavuz hazırlayacağı komutlar"  >>.\tablo.txt ;
echo "------------------------------------------------------------------------------------------------------------------" >> .\tablo.txt;

for($i=0; $i -le  $ogrenciSayisi-1; $i++)
{    
    echo "">.\secilenkomutlar.txt;    
    $ogrenciAdi=Get-Content -Encoding UTF8 -Path  .\ogrenciler.txt | Select-Object -Index $i; 
    for($j=0; $j -le  4; $j++)     
    {
    $uretilenKomut=(Get-Random -InputObject (get-content .\komutlar.txt));   
    echo $uretilenKomut  >> .\secilenkomutlar.txt;                           
    $uretilenKomutlar+=$uretilenKomut + " , ";                               
    }
    $bilgi=$ogrenciAdi+"                       " + $uretilenKomutlar;        
    $uretilenKomutlar="";                                                   
    echo $bilgi.Substring(0,$bilgi.Length-2) >> .\tablo.txt;                 


    $secilmisKomutlar = Get-Content -Path .\secilenkomutlar.txt;             
    $KomutlarDosyasi  = Get-Content -Path .\komutlar.txt | foreach {        
    if ($_ -notin $secilmisKomutlar) { $_ }
    }
    Set-Content -Path .\komutlar.txt -Value $KomutlarDosyasi -Encoding Ascii
}
```


Problemin çözümünü yaparken her öğrenciye atanan komutların sadece bir kere kullanılmak üzere ayarladım.Seçilen komutlar bir daha kullanılmayacaktır.


Bizim yapmak istediğimiz , her öğrenci için rastgele 5 komut üretmek.Her öğrenci için komut üretebilmek için öğrenci sayısını almamız gerekiyor.

Aşağıdaki komut ile ogrenciler.txt dosyasının içerisindeki satır sayısını yani öğrenci sayısını alıp,işlem yapmak üzere bir ```$ogrenciSayisi``` değişkenine atadım.

```
$ogrenciSayisi=(Get-Content .\ogrenciler.txt | Measure-Object –Line).Lines;
```

Her komutun sadece bir kere kullanılmasını istiyorum.İlk ana dosyam olan komutlar.txt üzerinden değişiklik yapmadan önce bu dosyanın yedeğini alacağım ki yeniden işlemler yapmak istediğim de tekrardan ilk halini kullanabileyim diye.

```
cp .\komutlar.txt .\yedekKomutListesi.txt    
```

her öğrenciye 5 komutun seçileceği listeyi tablo.txt dosyası içerisinde tutacağım.Aşağıdaki komut ile tablo.txt dosyasını oluşturuyorum.

```
ni .\tablo.txt;  
```

Hangi komutun seçilip seçilmediğini kontrol etmek için ,yani seçilen komutları secilenkomutlar.txt dosyasının içine yazdırıp bu seçilen komutları komutlar.txt dosyasının içerisinden silmek için kullanacağım.      

```
ni .\secilenkomutlar.txt;   
```


Sorunun çözümüne ulaşmak için 2 tane for döngüsü kullandım;

1. birinci for döngüsü her bir öğrenci için işlem yapmak için,

```
for($i=0; $i -le  $ogrenciSayisi-1; $i++)
{
    İşlemler ......
}
```

2. ikinci for döngüsü ise her bir öğrenci için 5 tane rastgele komut üretmek için.

```
 for($j=0; $j -le  4; $j++)
 {
    İşlemler....
 }
```


Aşağıdaki komut her öğrenci için secilenkomutlar.txt dosyasının sıfırlanmasını sağlar.Her bir öğrenci seçilen 5 komut dosyası komutlar.txt dosyası içerisinden silindikten sonra bu dosya sıfırlanıp yeniden işlemler yapılacak.

```
echo "">.\secilenkomutlar.txt;
```

Aşağıdaki kod parçası for döngüsünde ```$i``` değişkeni ile sırayla işlem yapılan her bir öğrencinin ismi ve soy ismini alır. ```-Encoding UTF8```  parametresi ise türkce karakter sorununu çözmek için kullanılmıştır. ```Select-Object -Index $i``` komutu ise dosyanın içerisinden ```$i.```  satırdaki bilgiyi yani kişinin adı ve soyadını almak için kullanılır.

```
$ogrenciAdi=Get-Content -Encoding UTF8 -Path  .\ogrenciler.txt | Select-Object -Index $i; 
```

2.for döngüsünün içerisinde kullanılan aşağıdaki 1.kod parçası ise komutlar.txt dosyasının içerisinden rastgele bir satırı çekmemizi sağlar.

2.satır ise rastgele çekilen komut ise  secilenkomutlar.txt dosyasına yazdırır.

3.satırdaki kod ise üretilen 5 komutu tablo.txt dosyasına yazdırılmak üzere aralarında virgül bırakılarak birleştirme işlemi yapar.

```
 $uretilenKomut=(Get-Random -InputObject (get-content .\komutlar.txt));   
 echo $uretilenKomut  >> .\secilenkomutlar.txt;                           
 $uretilenKomutlar+=$uretilenKomut + " , ";   
```



```$Bilgi``` değişkeni ise öğrenci ismi , soyadı ve onun için üretilen 5 komutu birleştirme işlemi yapar.Üretilen komutlar ve kullanıcı ismi , soyadı ile birleştirdiğine göre diğer bir öğrenci için işlem yapmak üzere ```$uretilenKomutlar``` değişkeni sıfırlıyorum.```$bilgi``` değişkenin içeriğini de ```tablo.txt``` içerisine ekliyorum.

Rastgele 5 komut üretip aralarında virgül ve boşluğu bırakıp ```$uretilenKomutlar``` değişkenine atamıştım.Üretilen 5.komuttan sonrasına da virgül ve boşluk bıraktığım için onları silmek istiyorum.En sondaki virgül ve  boşluğu silmek için ise ```substring``` komutunu kullanarak bütün bilgi değişkenin uzunluğundan son iki karakteri almayacak şekilde bir tanımlama yaptım.

```
    $bilgi=$ogrenciAdi+"                       " + $uretilenKomutlar;        
    $uretilenKomutlar="";                                                   
    echo $bilgi.Substring(0,$bilgi.Length-2) >> .\tablo.txt;   
```


Aşağıdaki  kod parçası ile secilenkomutlar ve komutlar dosyasının içeriği çekilip , seçilen komutların bir daha kullanılmaması için komutlar.txt dosyasının içerisinden secilenkomutlar.txt içerisindeki komutlar silinir.
  
  ```
    $secilmisKomutlar = Get-Content -Path .\secilenkomutlar.txt;             
    $KomutlarDosyasi  = Get-Content -Path .\komutlar.txt | foreach {        
    if ($_ -notin $secilmisKomutlar) { $_ }
    }
    Set-Content -Path .\komutlar.txt -Value $KomutlarDosyasi -Encoding Ascii
```
