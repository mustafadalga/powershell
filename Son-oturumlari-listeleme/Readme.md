#### Script Kodları

```
$bilgisayarAdi=$env:computername;
Get-ChildItem "\\$bilgisayarAdi\c$\Users" | Sort-Object LastWriteTime -Descending | Select-Object Name,LastWriteTime
```

1. 1.satırda ```$env:computername``` komutu ile işlem yapmak üzere olan bilgisayarın ismini alıp bir değişkene atıyoruz.
2. ```Get-ChildItem "\\$bilgisayarAdi\c$\Users"``` ilgili bilgisayardaki kullanıcıları getirir.
3. ```Sort-Object LastWriteTime -Descending``` ilgili bilgisayardaki kullanıcıların,bilgisayara son giriş tarihlerine göre sıralar.
4. ```Select-Object Name,LastWriteTime```   bilgisayarda oturum acmış kullanıcı adlarını ve erişim zamanını gösterir.

