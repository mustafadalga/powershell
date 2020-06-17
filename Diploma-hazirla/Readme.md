# Powershell ile her öğrenci için mezuniyet diploması hazırlama


## Kodlar


```
$bolumler= Get-Content .\bolumler.txt -Encoding UTF8;




if (!(test-path 'Diplomalar'))
{ 
    mkdir Diplomalar
}


$dizin =$PSScriptRoot+"\Diplomalar";


cat .\ogrenciler.txt -Encoding UTF8 | % {

    $Word = New-Object -ComObject Word.Application;
    $Document = $Word.Documents.Add();
    $Selection = $Word.Selection;

    $ImageName =$PSScriptRoot+"\logo.png"
    $Selection.TypeParagraph();
    $Selection.ParagraphFormat.Alignment=1
    $Selection.InlineShapes.AddPicture($ImageName)
    $Selection.TypeParagraph();
   
    $yil=Get-Random -Minimum 2018 -Maximum 2023;
    $yil2=$yil+1;
    $tc=Get-Random;
    $isim=$_+".docx";

    $bolum=(Get-Random -InputObject $bolumler);

    $path=$dizin+"\"+$_;
    $Selection.Font.Bold=5;
    $Selection.Font.Size=24;
    $Selection.ParagraphFormat.Alignment=1
    $Selection.TypeText("Marmara Üniversitesi");

    $Selection.TypeParagraph();
    $Selection.Font.Size=20;
    $Selection.Font.Bold=1;
    $Selection.TypeText("Lisans Diploması");

    $Selection.TypeParagraph();
    $Selection.Font.Size=20;
    $Selection.Font.Bold=1;

    $Selection.TypeParagraph();
    $Selection.ParagraphFormat.Alignment=0;
    $Selection.Font.Size=12;
    $Selection.Font.Bold=0;
    $Selection.TypeText("$tc Tc kimlik numaralı $_ , $bolum'ından 2012 yılında, programınının lisans çalışmalarının başarıyla tamamlayarak bu diplomayı almaya hak kazanmıştır.");
    $Document.SaveAs([ref]$path,[ref]$SaveFormat::wdFormatDocument);
    $Word.Quit();

}
```