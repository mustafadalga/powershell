# Powershell'de For Döngüsü Kullanımı

**For döngüsünün nasıl kullanıldığına dair, 50 ile 100 arası sayılar isminde txt dosyaları oluşturan bir script.**

#### Kodlar

```
for($i=50; $i -le 100; $i++)
{
    New-Item -Name $i".txt"
}
```