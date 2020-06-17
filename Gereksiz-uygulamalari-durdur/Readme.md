# Gereksiz Uygulamaların Çalışmasını Durdur

**Bir txt dosyasındaki uygulamaların çalışmasının durduran bir script.**

```
cat .\uygulamaListesi.txt | Foreach {   Stop-Process -Name $_  }

```