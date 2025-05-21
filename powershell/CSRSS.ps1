function Is-FilePresent {
    param (
        [string]$FilePath
    )

    return (Test-Path $FilePath) -and (-not (Test-Path $FilePath -PathType Leaf))
}

function IsPEExecutable {
    param (
        [string]$FilePath
    )

    $header = Get-Content -LiteralPath $FilePath -Encoding Byte -TotalCount 2
    $signature = [System.BitConverter]::ToUInt16($header, 0)

    return $signature -eq 23117  # 'MZ' signature for PE executables
}

function IsFileSignatureValid {
    param (
        [string]$FilePath
    )

    try {
        $signatureStatus = Get-AuthenticodeSignature -FilePath $FilePath | Where-Object { $_.Status -eq 'Valid' }
        return $signatureStatus.Count -gt 0
    }
    catch {
        return $false
    }
}

function csrss {
    Write-Host "[Memory Scanner] Loading USNJournal into memory..." -ForegroundColor Yellow

    $Username = ([System.Security.Principal.WindowsIdentity]::GetCurrent().Name -split '\\')[1]

    $FilePath1 = "C:\res1.txt"
    $FilePath2 = "C:\res2.txt"

    $RegexModifiedExtension = "(?!.*(\.exe|\.dll|\\|\.dll\..*\.config|\.exe\.config)$)^[A-Z]:\\.*\..*"
    $RegexDllInjection = "^[A-Za-z]:\\.+?\.((?!exe).)*$"
    $RegexExecutedFile = "^[A-Za-z]:\\.+?.exe"
    $RegexFilesWithoutExtension1 = "^[A-Za-z]:\\(?:[^.\\]+\\)*[^.\\]+$"
    $RegexFilesWithoutExtension2 = "^\\?\?\\?\\(?:[^.\\]+\\)*[^.\\]+$"

    $MaxLineLength = 260
    $PrintedMatches = @()

    foreach ($FilePath in @($FilePath1, $FilePath2)) {
        if (Test-Path $FilePath) {
            if ((Test-Path $FilePath -PathType Leaf) -and (-not (Test-Path $FilePath -PathType Container))) {
                $InputFile = Get-Content $FilePath
                foreach ($Line in $InputFile) {
                    if ($Line.Length -gt $MaxLineLength) {
                        continue
                    }

                    $ColonPos = $Line.IndexOf(':')
                    if ($ColonPos -ne -1 -and $ColonPos + 2 -lt $Line.Length) {
                        $MatchedString = $Line.Substring($ColonPos + 2)

                        if ($MatchedString -match $RegexModifiedExtension) {
                            if (-not $PrintedMatches.Contains($MatchedString)) {
                                if (Is-FilePresent $MatchedString) {
                                    if ((Test-Path $MatchedString) -and (-not (Test-Path $MatchedString -PathType Container)) -and (-not (IsFileSignatureValid $MatchedString))) {
    Write-Host "[#] Executed & Not signed executable file with a modified extension: $MatchedString"
}
                                } else {
                                    Write-Host "[#] Executed & Not present file with a modified extension: $MatchedString"
                                }

                                $PrintedMatches += $MatchedString
                                continue
                            }
                        }

                        if ($MatchedString -match $RegexDllInjection) {
                            if (-not $PrintedMatches.Contains($MatchedString)) {
                                if ((Test-Path $MatchedString) -and (-not (Test-Path $MatchedString -PathType Container)) -and (-not (IsFileSignatureValid $MatchedString))) {
    Write-Host "[#] Executed & Not signed file: $MatchedString"
}


                                $PrintedMatches += $MatchedString
                                continue
                            }
                        }

                        if ($MatchedString -match $RegexExecutedFile) {
                            if (-not $PrintedMatches.Contains($MatchedString)) {
                                if ((Test-Path $MatchedString) -and (-not (Test-Path $MatchedString -PathType Container)) -and (-not (IsFileSignatureValid $MatchedString))) {
    Write-Host "[#] Executed & Not signed file: $MatchedString"
}


                                $PrintedMatches += $MatchedString
                                continue
                            }
                        }

                        if ($MatchedString -match $RegexFilesWithoutExtension1 -or $MatchedString -match $RegexFilesWithoutExtension2) {
                            if (-not (Test-Path $MatchedString)) {
                                Write-Host "[#] Executed & Not present file without extension: $MatchedString"
                            }
                        }
                    }
                }
            }
        }
        else {
            Write-Host "Please re-enter a valid file path, it should include the file extension without double quotes." -ForegroundColor Red
        }
    }
}

csrss
