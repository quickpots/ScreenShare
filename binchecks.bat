@echo off
setlocal enabledelayedexpansion

REM Get SID
for /f "tokens=2 delims==" %%I in ('wmic useraccount where name^="%USERNAME%" get sid /value') do set "SID=%%I"

REM Recycle Bin Path
set "recycle_bin_path=%SystemDrive%\$Recycle.Bin\%SID%"

set /p checkRecycleBin="Do you want to check the modification time of the Recycle Bin? (Y/N): "
if /i "%checkRecycleBin%"=="Y" (
    for %%F in ("%recycle_bin_path%") do (
        set "modTime=%%~tF"
        echo -------------------------------
        echo Recycle Bin Last Modified: !modTime!
        echo -------------------------------
    )
)