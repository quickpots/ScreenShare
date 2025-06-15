 New-Item -Path 'c:\AutoMation\' -ItemType Directory -Force

Compress-Archive -LiteralPath "C:\Users\$env:username\AppData\Roaming\.minecraft\logs\" -DestinationPath "C:\Users\$env:username\AppData\Roaming\.minecraft\logs\archive.zip" -force
Compress-Archive -LiteralPath "C:\Users\$env:username\.lunarclient\offline\multiver\logs\" -DestinationPath "C:\Users\$env:username\AppData\Roaming\.minecraft\logs\archive2.zip" -force

Get-ChildItem C:\Users\$env:username\AppData\Roaming\.minecraft\logs\*.zip | Expand-Archive -DestinationPath c:\AutoMation\ -Force

$folderPath = 'c:\AutoMation\*.log'
$pattern = 'user:'

Get-ChildItem $folderPath -recurse |
Select-String -pattern $pattern |
Select Path, Placeholder, LineNumber, Line, Pattern, Context, Matches |
Out-GridView



GridView
 
