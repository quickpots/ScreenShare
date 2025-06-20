Write-Host -ForegroundColor Cyan " __  __  _        _        ___  ___"
Write-Host -ForegroundColor Cyan "|  \/  |(_) _ _  (_)      / __|/ __|"
Write-Host -ForegroundColor White "| |\/| || || ' \ | |      \__ \\__ \"
Write-Host -ForegroundColor White "|_|  |_||_||_||_||_|      |___/|___/"
Write-Host
Write-Host -ForegroundColor White "By UnMonsieur#8388"

$extensions = "*.jar"
$strings = "mod_d.classUT"
$path = "C:\SS1\JarChecks"


$i = 0
$total = (Get-ChildItem -Path $path -Include $extensions -Recurse -File).Count
Write-Progress -Activity "Expanding subdirectories..." -Status "Analyzing" -PercentComplete 0


$ErrorActionPreference = 'SilentlyContinue'

$results = @()

Get-ChildItem -Path $path -Include $extensions -Recurse -File | 
ForEach-Object { 
    $file = $_
    $content = Get-Content $file.FullName -Raw
    foreach($string in $strings){
        if($content.Contains($string)){
            $result = [PSCustomObject]@{
                FileName = $file.FullName
                StringMatched = $string
            }
            $results += $result
        }
    }
    $i++
    Write-Progress -Activity "Searching for files" -Status "Processing" -PercentComplete (($i/$total)*100)
}


$ErrorActionPreference = 'Continue'


$results | Export-Csv -Path "FullScan.csv" -NoTypeInformation


Write-Host "Results saved in current directory!" -ForegroundColor Green
