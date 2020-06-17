# Mutlu Yıllar Böte

**Rastgele renklerden oluşan dinamik yıl başı ağaçlı yazı yazma scripti.**

#### Kodlar

```
$colors = "Cyan","Green","Yellow","Red","Magenta","White"
Clear-Host
Write-Host
 
While($true)
{
    $oldpos = $host.ui.RawUI.CursorPosition
    Write-Host "        *" -ForegroundColor ($colors | get-random)
    # Row One
    Write-Host "       *" -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"        -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"        -ForegroundColor ($colors | get-random)
    # Row Two
    Write-Host "      *" -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random)
    # Row Three
    Write-Host "     *"  -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random)
    # Row Four
    Write-Host "    *"   -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random)
    # Row Five
    Write-Host "   *"    -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random)
    # Row Six
    Write-Host "  *"     -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random) -nonewline
    Write-Host "*"       -ForegroundColor DarkGreen              -nonewline
    Write-Host "*"       -ForegroundColor ($colors | get-random)
    # Stump
    Write-Host "       ***       " -ForegroundColor DarkGreen
    Write-Host "       ***       " -ForegroundColor DarkGreen
    Write-Host " Mutlu Yillar BÖTE"
    $host.ui.RawUI.CursorPosition = $oldpos
    sleep .40
}
Write-Host

```