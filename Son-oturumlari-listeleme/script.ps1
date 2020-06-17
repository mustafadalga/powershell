$bilgisayarAdi=$env:computername;
Get-ChildItem "\\$bilgisayarAdi\c$\Users" | Sort-Object LastWriteTime -Descending | Select-Object Name,LastWriteTime
