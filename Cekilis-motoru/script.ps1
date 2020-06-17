
function dosyaSil{
    if(test-path "isimListesi.txt"){
    rm .\isimListesi.txt
    }
    if(test-path "kazananListesi.txt"){
    rm .\kazananListesi.txt
    }
}

function kazananListesiGetir() {
    return Get-Content -Encoding UTF8 -Path .\kazananListesi.txt
}

function isimListesiOlustur{
Get-Content -Encoding UTF8 .\isimler.txt | sort-object –Unique  > .\isimListesi.txt
}

dosyaSil;
isimListesiOlustur;


[int]$kazananSayisi=Read-Host "Çekilişte kazanacak kişi sayısını giriniz";
[int]$yedekSayisi=Read-Host "Yedek sayısını giriniz";
$toplam=$kazananSayisi+$yedekSayisi;

echo "..........................KAZANANLAR................." >>  .\kazananListesi.txt; 
echo "..........................KAZANANLAR.................";

for($j=1; $j -le  $toplam; $j++)     
{   
    $kullanici=Get-Random -InputObject (Get-Content .\isimListesi.txt);

    echo $kullanici >> .\kazananListesi.txt; 
    echo $kullanici;

    if($j -eq $kazananSayisi)
        {
            echo "..........................YEDEKLER................." >>.\kazananListesi.txt;  
            echo "..........................YEDEKLER.................";  
        }

        $kazananListesi=kazananListesiGetir  
        $isimListesi  = Get-Content -Encoding UTF8 -Path .\isimListesi.txt | foreach {        
        if ($_ -notin $kazananListesi) { $_ }
        }
        Set-Content -Path .\isimListesi.txt -Value $isimListesi -Encoding UTF8
}

