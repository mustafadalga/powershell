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


