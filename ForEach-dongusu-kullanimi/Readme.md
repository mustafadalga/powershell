# Powershell'de ForEach Döngüsü Kullanımı

**Foreach döngüsünün nasıl kullanıldığına dair, 50 ile 100 arası sayılar isminde txt dosyaları oluşturan bir script.**

#### Kodlar

```
50..100 | % { New-Item -name $_".txt" }
```