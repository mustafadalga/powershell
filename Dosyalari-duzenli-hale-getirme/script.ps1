Get-ChildItem .\  | foreach { 
    $tarih = $_.LastWriteTime.ToShortDateString()
    $klasorismi = Get-Date $tarih -Format yyyy.MM.dd
    $DuzenliKlasor = ".\$klasorismi"
    if (test-path $DuzenliKlasor)
    { 
        move-item $_.fullname $DuzenliKlasor 
    }
    else 
    {
      mkdir $DuzenliKlasor
      move-item $_.fullname $DuzenliKlasor 
    }
}