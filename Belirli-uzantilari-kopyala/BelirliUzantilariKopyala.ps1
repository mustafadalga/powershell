$sourceRoot = "C:\Users\Mustafa\Desktop\lab\*.pdf"
$destinationRoot = "C:\Users\Mustafa\Desktop\oz"

Copy-Item -Path $sourceRoot -Filter "*.pdf" -Recurse -Destination $destinationRoot -Container