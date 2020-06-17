cd ~\Desktop;

$HTML=Invoke-WebRequest -Uri https://www.akademikpersonel.org/anasayfa/akademik-ilanlar/

$mesaj=0;

If(Test-Path .\ilanlar.txt)
{
    $ilanlar=Get-Content .\ilanlar.txt;
    $mesaj=1;
}
else
{
    ni .\ilanlar.txt;
    $ilanlar=Get-Content .\ilanlar.txt;
    $mesaj=0;
}

$SonKontrolTarihi=(Get-Item .\ilanlar.txt | Foreach {$_.LastWriteTime}).ToLongDateString();
$Suan=(get-date -UFormat "%d %B %A %G");


$YeniIlanlar=@();

$HTML.ParsedHtml.getElementsByTagName('div') |
  Where-Object { $_.className -eq 'info' } |
  ForEach-Object { $_.getElementsByTagName('a') } |
  Where-Object { $_.className -eq 'title' } | % {
  
       If(($_.outertext +"  : " +$_.href) -notin $ilanlar)
       {
        echo ($_.outertext +"  : " +$_.href) >>.\ilanlar.txt;
        $YeniIlanlar+=($_.outertext +"  : " +$_.href);
       }
   }


   If($mesaj -eq 1)
   {
       If($YeniIlanlar.Count -gt 0)
       {
          echo ("Son baktığınız zaman:"+$SonKontrolTarihi);
          echo ("Bugün:"+$Suan);
          echo "Son baktığınızdan beri eklenen yeni personel ilanları var! Bunlar:";
  
          for($i=0; $i -le $YeniIlanlar.Count-1; $i++)
          {
             echo ([string]($i+1)+")"+$YeniIlanlar[$i]);
          }
       }
       else
       {
           echo ("Son baktığınız zaman:"+$SonKontrolTarihi);
           echo ("Bugün:"+$Suan);
           echo "Son baktığınızdan beri yeni bir personel ilanı eklenmemiş.";   
       }   
   }
   else
   {
       If($YeniIlanlar.Count -gt 0)
       {
          echo "Yeni personel ilanları var! Bunlar:";
          $YeniIlanlar;
       }
       else
       {
          echo "Yeni bir personel ilanı eklenmemiş.";   
       }      
   }