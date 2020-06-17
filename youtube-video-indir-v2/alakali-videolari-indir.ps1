param($AnaVideo);


youtube-dl $AnaVideo;

$HTML=Invoke-WebRequest -Uri $AnaVideo
$HTML.Links | Where-Object { $_.href -like '/watch*' -and $_.title } | % { "https://www.youtube.com"+$_.href; } | select -First 5 | % {  youtube-dl $_; }

