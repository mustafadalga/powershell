$masaustuYol = [Environment]::GetFolderPath("Desktop");

mkdir $masaustuYol\BELGELER
mkdir $masaustuYol\RESİMLER
mkdir $masaustuYol\ViDEO
mkdir $masaustuYol\Mp3
mkdir $masaustuYol\HTML
Move-Item -Path $masaustuYol\*.pdf -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.docx -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.xlsx -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.pptx -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.txt -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.bat -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.ps1 -Destination $masaustuYol\BELGELER
Move-Item -Path $masaustuYol\*.jpg -Destination $masaustuYol\RESİMLER
Move-Item -Path $masaustuYol\*.png -Destination $masaustuYol\RESİMLER
Move-Item -Path $masaustuYol\*.jpeg -Destination $masaustuYol\RESİMLER
Move-Item -Path $masaustuYol\*.mpeg -Destination $masaustuYol\ViDEO
Move-Item -Path $masaustuYol\*.mp4 -Destination $masaustuYol\ViDEO
Move-Item -Path $masaustuYol\*.mpg -Destination $masaustuYol\ViDEO
Move-Item -Path $masaustuYol\*.mpeg -Destination $masaustuYol\ViDEO
Move-Item -Path $masaustuYol\*.avi -Destination $masaustuYol\ViDEO
Move-Item -Path $masaustuYol\*.mp3 -Destination $masaustuYol\Mp3
Move-Item -Path $masaustuYol\*.html -Destination $masaustuYol\HTML

Get-ChildItem -Attributes !System –Path $masaustuYol\*.*  | Where-Object {($_.LastAccessTime -lt (Get-Date).AddDays(-90))} | Remove-Item -Confirm:$true
