# Üniversite Kısmi Zamanlı Öğrenci Alımı 

## Problem
Üniversitenin kısmi zamanlı öğrenci alımı  için 180 öğrenci başvuruda bulundu. Bu başvura bulunan 180 öğrenciyi *basvurular.txt* adı altında topladık. Kısmi öğrenci alacak 35 farklı bölüm bulunmaktadır. Bu bölümler *bolumler.txt* adı altında toplanmış durumdadır. Her bir bölüme 3 öğrenci alınacaktır. Bu duruma yardımcı olacak bir script oluşturunuz.(Bir bölüme atanan öğrenciler farklı bir bölüme daha atanamazlar.)


## Çözüm

#### Kodlar
```

$bolumSayisi=(Get-Content .\bolumler.txt | Measure-Object –Line).Lines;

$bolumler=Get-Content .\bolumler.txt -Encoding UTF8;
$basvurular=Get-Content .\basvurular.txt -Encoding UTF8;
$s=0;

for($i=1; $i -le ($bolumSayisi*3); $i++)
{
     echo ($bolumler[$s]+"   "+$basvurular[$i-1])>> .\secilenler.txt;
     If($i%3 -eq 0)
     {
       $s++;
     }
}

```