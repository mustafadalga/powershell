Get-ChildItem -File | %{ 

    If(!($_.Extension -eq '.ps1'))
   {
        $_.BaseName>>.\isimler.txt; $_.Extension>>.\uzantilar.txt
   }
 }

$isimler=Get-Content -Encoding UTF8 .\isimler.txt;
$uzantilar=Get-Content -Encoding UTF8 .\uzantilar.txt;

for($i=0; $i -le (Get-Content .\isimler.txt).Length-1; $i++)
{
     ffmpeg -i ($isimler[$i]+$uzantilar[$i])  ($isimler[$i]+".mp3");
}
 if (test-path 'mp3')
    { 
        move .\*.mp3 mp3; 
    }
 else 
   {
     mkdir mp3;
     move .\*.mp3 mp3; 
   }
    
del .\*.txt;
