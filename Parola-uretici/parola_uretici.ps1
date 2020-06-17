param($kucukHarf,$buyukHarf,$sayi,$ozelKarakter);

$password=$null;


function Get-RandomCharacters($length, $characters) { 
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length } 
    $private:ofs="" 
    return [String]$characters[$random]
}



$password += Get-RandomCharacters -length $kucukHarf -characters 'abcdefghiklmnoprstuvwxyz';
$password += Get-RandomCharacters -length $buyukHarf -characters 'ABCDEFGHKLMNOPRSTUVWXYZ';
$password += Get-RandomCharacters -length $sayi -characters '1234567890';
$password += Get-RandomCharacters -length $ozelKarakter -characters '!"§$%&/()=?}][{@#*+';


echo "Oluşturulan Parola:$password";