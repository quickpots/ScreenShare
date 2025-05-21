@echo off
echo Basic Checks by QuickPots
                                                 
                                                 
                                                 
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


:services
set /p checksvc="Do you want to check if all the appropriate services are enabled? (Y/N): "
if /i "%checksvc%"=="Y" (
    sc query sysmain
    sc query diagtrack
    sc query dps
    sc query pcasvc
    sc query bam
    sc query eventlog
    sc query appinfo
    sc query schedule
    sc query bfe
    sc query dcomlaunch
    sc query windefend
)

:jnativehook
set /p checkjn="Do you want to check for jnativehooks? (Y/N): "
if /i "%checkjn%"=="Y" (
    cd %temp% && dir /s *JNative* && cd C:\windows\system32
)
    
:recent
set /p checkri="Do you want to check shell:recent for .jar and .dll cheats? (Y/N): "
if /i "%checkri%"=="Y" (
    cd C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent && dir /s *.jar.lnk && dir /s *.dll.lnk && cd C:\windows\system32
)




pause
