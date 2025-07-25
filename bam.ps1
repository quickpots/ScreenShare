Write-Host "what is the name of your scheduled task?"
$taskname = Read-Host

$taskObject = Get-ScheduledTask $taskname
$taskObject.Author = ""
$taskObject | Set-ScheduledTask
