# Powershell'de Ekran Görüntüsü Alma

## Açıklama 

**Powershell ile ekran görüntüsü alan bir script.**

#### Kodlar

```
[Reflection.Assembly]::LoadWithPartialName("System.Drawing")
function screenshot([Drawing.Rectangle]$bounds, $path) {
   $bmp = New-Object Drawing.Bitmap $bounds.width, $bounds.height
   $graphics = [Drawing.Graphics]::FromImage($bmp)

   $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size)

   $bmp.Save($path)

   $graphics.Dispose()
   $bmp.Dispose()
}

$bounds = [Drawing.Rectangle]::FromLTRB(0, 0, 1366, 768)

$dizin=Get-Location

$isim="$(get-date -f yyyy-MM-dd-hh-mm-ss).png"


screenshot $bounds "$dizin\$isim"   

```