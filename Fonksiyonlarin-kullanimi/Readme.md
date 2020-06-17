# Powershell'de Fonksiyonların Kullanımı

**Fonksiyonların nasıl kullanılabileceğine dair örnekler**

### Ekrana merhaba yazdıran fonksiyon

#### Kodlar

```
function hello-world 
{ 
write-host "hello world" 
}

hello-world;
```

#### Kullanım
```
 .\script.ps1
 ```



### Dışarıdan alınan sayının karesini alan fonksiyon

#### Kodlar

```
param($sayi);

function kareAl($sayi)
{
   return ($sayi*$sayi);
}

kareAl($sayi);
```

#### Kullanım
```
 .\script.ps1 -sayi 4
 ```