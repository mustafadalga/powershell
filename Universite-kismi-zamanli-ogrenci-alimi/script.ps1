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


