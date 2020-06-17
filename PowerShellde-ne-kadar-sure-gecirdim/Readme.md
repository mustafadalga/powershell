# PowerShell'de ne kadar süre geçirdim

## Problem

```
20.11.2018, 13:41 - 23 dk 12 sn
20.11.2018 , 13:47 - 10 dk 36 sn
22.11.2018, 14:05 - 1sa 02dk 10sn
...
```

Yukarıda, log.txt isimli bir dosyanın içeriği görülmektedir.

Bu dosyaya, bu bilgisayarda siz her yeni bir PowerShell penceresi açtığınızda yeni bir satır eklenmekte, görüldüğü üzere en başta günün tarihi ve saati yazmaktadır.  Tireden sonraki alanda ise yanda belirtilen tarihte açılmış olan PowerShell penceresinin ne kadar süre açık tutulduğunun zaman kaydı bulunmaktadır.

Yani yukarıdaki belgeye göre ben 20 kasım 2018 günü iki tane PowerShell penceresi açmışım, bunlardan ilkini 23 dakika, ikincisini de 10 dk içerisinde kapatmışım.

PowerShell'imiz her açıldığında bu şekilde bir kayıt tutmasını nasıl sağlayabiliriz?

**İpucu:** Bunu yapmak için, powershell her açıldığında arkaplanda çalışacak ve saniyeleri sayacak bir çeşit sayaç başlatmamız gerekiyor. Bu sayaç arkaplanda çalışmalı ki o sayarken biz PowerShell'de diğer işlemlerimizi normal biçimde yapabilelim. Saniye sayabilmek için kullanabileceğimiz komut start-sleep ve arkaplan işleri için kullanabileceğimiz komut start-job

## Çözüm


Problemin çözümü için kullanılabilecek script kodları

```
Start-Job -Name kayit -ScriptBlock {

 $tarih=Get-Date -UFormat "%d.%m.%Y";
 $saat=0;
 $dakika=0;
 $saniye=0;
 $hour;
 $minute;
 $second;
 $dizin="$home\Desktop\log.txt"
 if(!(Test-Path $dizin))
 {
   ni $dizin;
   Add-Content $dizin "Tarih         -     Geçirilen Süre"; 
   Add-Content $dizin "";  
 }
 else
 {
   Add-Content $dizin "";  
 }
 $dosya = (Get-Content $dizin); 
 
  while($true)
    {
     Start-Sleep 1;
     $saniye=($saniye+1);
     If($saniye -eq 60)
     { 
      $saniye=0;
      $dakika=($dakika+1);
     }
     If($dakika -eq 60)
     {
      $saniye=0;
      $dakika=0;
      $saat=($saat+1);
     }
     If($saat.ToString().Length -eq 1) { $hour=("0"+$saat.ToString()); } else { $hour=$saat;  }
     If($dakika.ToString().Length -eq 1) { $minute=("0"+$dakika.ToString()); } else { $minute=$dakika;  }
     If($saniye.ToString().Length -eq 1) { $second=("0"+$saniye.ToString()); } else { $second=$saniye;  }
     $sure=([string]$tarih+"    -     " +$hour+" : "+$minute+" : "+$second);

     $dosya[$dosya.Length-1]=$sure;
     $dosya | Set-Content $dizin;
    }
}



```
