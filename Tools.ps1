$desktop = [System.Environment]::GetFolderPath("Desktop")
$folder = "$desktop"
New-Item -ItemType Directory -Path $folder -Force
$zipPath = "$folder\SS.zip"
Invoke-WebRequest -Uri "https://quickpots.fun/screenshare/SS.zip" -OutFile $zipPath
Start-Process $folder
