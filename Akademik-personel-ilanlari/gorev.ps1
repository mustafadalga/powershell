$masaustu = [Environment]::GetFolderPath("Desktop");
$yol="$masaustu\script.ps1";
$Trigger= New-ScheduledTaskTrigger -At 13:00 -Daily 
$Action= New-ScheduledTaskAction -Execute "PowerShell.exe"  -Argument "-executionpolicy bypass -NoExit -noprofile -file $yol" 
Register-ScheduledTask -TaskName Gorev -Trigger $Trigger -Action $Action -RunLevel Highest -Force
