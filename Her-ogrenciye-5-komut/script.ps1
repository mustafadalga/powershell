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


