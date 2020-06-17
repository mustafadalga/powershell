cat .\uygulamaListesi.txt | Foreach {   Stop-Process -Name $_  }
