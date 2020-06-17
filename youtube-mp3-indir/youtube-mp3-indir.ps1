param($url);

mkdir Download;
cd Download;

youtube-dl $url;

Get-ChildItem | % { $_.BaseName>>.\isim.txt; $_.Extension>>.\uzanti.txt }

$isim=Get-Content -Encoding UTF8 .\isim.txt;
$uzanti=Get-Content -Encoding UTF8 .\uzanti.txt;

ffmpeg -i ($isim+$uzanti)  ($isim+".mp3");

move .\*.mp3 ../
cd ../
Remove-Item .\Download -Recurse