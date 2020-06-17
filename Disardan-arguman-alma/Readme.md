# Dışardan Argüman Alma


**Dışarıdan nasıl arguman değerler alınabileceğini gösteren script örnekleri**


#### Örnek Kullanım 1

```
param($isim,$soyisim);

echo ("Merhaba "+ $isim+" "+$soyisim);
```

#### Örnek Kullanım 2

```
$isim=$args[0];
$soyisim=$args[1];
echo ("Merhaba "+ $isim+" "+$soyisim);
```