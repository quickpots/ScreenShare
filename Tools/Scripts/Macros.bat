@echo off
set "localAppData=%LOCALAPPDATA%"
set "appData=%APPDATA%"
set "programFilesX86=%PROGRAMFILES(X86)%"
set "programFiles=%PROGRAMFILES%"
set "Logitech=%localAppData%\LGHUB\settings.db"
set "Glorious=C:\Users\%username%\AppData\Local\BY-COMBO2\mac"
set "Glorious1=C:\ProgramData\Glorious Core\userdata\guru\data\MacroDB.db" //
set "Glorious2=C:\ProgramData\Glorious Core\userdata\guru\data\DevicesDB.db" // 
set "corsair=%appData%\corsair\CUE\config.cuecfg"
set "bloody=%programFilesX86%\Bloody7\Bloody7\UserLog\Mouse\TLcir_9EFF3FF4\language\Settings\EnvironmentVar.ini"
set "steel=%appData%\steelseries-engine-3-client\Session Storage\000003.log"
set "Steel1=C:\Program Files\SteelSeries\GG"
set "Alienware=%ALLUSERSPROFILE%\Alienware\AlienWare Command Center\fxmetadata\.json"
set "Motospeed=%programFiles%\Gaming MouseV30\record.ini"
set "Marsgaming=%programFilesX86%\Gaming Mouse\Config.ini"
set "Marsgaming2=%localAppData%\BY-8801-GM917-v108\curid.dtc"
set "Ayax=%programFiles%\AYAX GamingMouse\config.bin"
set "T2=%localAppData%\BY-COMBO\pro.dtc"
set "Xenon200=%programFilesX86%\Xenon200\Configs"
set "Reddragon=%appData%\REDRAGON\GamingMouse\config.ini"
set "Reddragon2=%appData%\REDRAGON\GamingMouse\macro.ini"
set "Reddragon3=%appData%\REDRAGON\GamingMouse\Macro"
set "Blackweb=C:\Blackweb Gaming AP\config"
set "Razer1=%PROGRAMDATA%\Razer\Razer Central\Accounts"
set "Razer2=%LOCALAPPDATA%\Razer\Synapse3\Settings" 
set "Razer3=C:\ProgramData\Razer\Synapse3\Log"
set "Razer4=%localAppData%\Razer\Synapse\log\macros\MacrosRazer3.txt" 
set "RazerT=C:\ProgramData\Razer\Synapse3\Log\SynapseService.log" 
set "Roccat=C:\Users\%username%\AppData\Roaming\ROCCAT\SWARM\macro\macro_list.dat" 
set "Roccat2=C:\Users\%username%\AppData\Roaming\ROCCAT\SWARM\macro\custom_macro_list.dat" 
set "Roccat3=C:\Users\%username%\AppData\Roaming\ROCCAT\SWARM\macro\macro_list.dat" 
set "General1=C:\users\%username%\appdata\BYCOMBO2\mac\*mcf" 
set "KromKolt=C:\Users\%username%\AppData\Local\VirtualStore\Program Files (x86)\KROM KOLT\Config\sequence.dat" 
set "Asus=C:\users\%username%\documents\ASUS\ROG\ROG Armoury\common\macro\*.GMAC" 
set "Fantech=C:\Program Files (x86)\FANTECH VX7 Gaming Mouse\config.ini" 
set "T16=%LOCALAPPDATA%\BY-COMBO\curid.dct" 
set "T161=%LOCALAPPDATA%\BY-COMBO\pro.dct" 
set "LIX=C:\Program Files (x86)\SPC Gear" 
set "Marvo=%localAppData%\BY-8801-GM917-v108\curid.dct" 
set "Marvo2=%localAppData%\BY-8801-GM917-v108\pro.dct" 
set "ReDragon=C:\Users%username%\AppData\Roaming\REDRAGON\GamingMouse\config.ini" 
set "ReDragon2=C:\Users%username%\AppData\Roaming\REDRAGON\GamingMouse\macro.ini"
set "ReDragon3=C:\Users%username%\AppData\Roaming\REDRAGON\GamingMouse" 
set "ReDragonM7=C:\Users%USERNAME%\Documents\M711\*.MacroDB"
set "kolke=C:\Program Files (x86)\Driver Nombredemouse\INI_CN\*.dat"
set "kolke2=C:\Program Files (x86)\Driver Nombredemouse\INI_EN\*.dat"
set "Aukey=%localappdata%\JM01"
set "RaptureMacro=%PROGRAMFILES(X86)%\Rapture\Rapture COBRA\Data\ms_1\macro.data"
set "RaptureConfig=%PROGRAMFILES(X86)%\Rapture\Rapture COBRA\Data\ms_1\Config_1.data"
cls

if exist "%RaptureMacro%" (
    for %%A in ("%RaptureMacro%") do ( 
        echo %d%Rapture Cobra Macro Detected, Modified At: %%~tA
    )
)

if exist "%RaptureConfig%" (
    for %%A in ("%RaptureConfig%") do ( 
        echo %d%Rapture Cobra Mouse Detected, Modified At: %%~tA
    )
)

if exist "%Aukey%" (
    for %%A in ("%Aukey%") do ( 
        echo %d%Aukey Mouse Detected, Modified At: %%~tA
    )
)

if exist "%kolke%" (
    for %%A in ("%kolke%") do (
        echo %d%Kolke Mouse Detected, Modified at: %%~tA
    )
)

if exist "%kolke2%" (
    for %%A in ("%kolke2%") do (
        echo %d%Kolke Mouse Detected, Modified at: %%~tA
    )
)

if exist "%Roccat%" (
    for %%A in ("%Roccat%") do (
        echo %d%Roccat mouse detected, Modified at: %%~tA
    ) 
)


if exist "%Roccat2%" (
    for %%A in ("%Roccat2%") do (
        echo %d%Roccat detected, Modified at: %%~tA
    ) 
)



if exist "%Roccat3%" (
    for %%A in ("%Roccat3%") do (
        echo %d%Roccat mouse detected, Modified at: %%~tA
    ) 
)






if exist "%General1%" (
    for %%A in ("%General1%") do (
        echo %d%Glorious, Ajazz, AVF, yanpol or uRage Macro detected, Modified at: %%~tA
    ) 
)


if exist "%KromKolt%" (
    for %%A in ("%KromKolt%") do (
        echo %d%KromKolt Mouse detected, Modified at: %%~tA
    ) 
)


if exist "%Asus%" (
    for %%A in ("%Asus%") do (
        echo %d%Asus Macro detected, Modified at: %%~tA
    ) 
)

if exist "%Fantech%" (
    for %%A in ("%Fantech%") do (
        echo %d%Fantech Mouse detected, Modified at: %%~tA
    ) 
)

if exist "%T161%" (
    for %%A in ("%T161%") do (
        echo %d%T16 Mouse detected, Modified at: %%~tA
    ) 
)




if exist "%T16%" (
    for %%A in ("%T16%") do (
        echo %d%T16 Mouse detected, Modified at: %%~tA
    ) 
)


if exist "%LIX%" (
    for %%A in ("%LIX%") do (
        echo %d%Lix Mouse detected, Modified at: %%~tA
    ) 
)



if exist "%Marvo%" (
    for %%A in ("%Marvo%") do (
        echo %d%Marvo Mouse detected, Modified at: %%~tA
    ) 
)



if exist "%Marvo2%" (
    for %%A in ("%Marvo2%") do (
        echo %d%Marvo Mouse detected, Modified at: %%~tA
    ) 
)



::

if exist "%ReDragon%" (
    for %%A in ("%ReDragon%") do (
        echo %d%ReDragon Mouse detected, Modified at: %%~tA
    ) 
)




if exist "%ReDragon2%" (
    for %%A in ("%ReDragon2%") do (
        echo %d%ReDragon Mouse detected, Modified at: %%~tA
    ) 
)


if exist "%ReDragon3%" (
    for %%A in ("%ReDragon3%") do (
        echo %d%ReDragon Mouse detected, Modified at: %%~tA
    ) 
)

if exist "%ReDragonM7%" (
    for %%A in ("%ReDragonM7%") do (
        echo %d%ReDragon M711 Mouse detected, Modified at: %%~tA
    ) 
)



findstr /C:"turbo: true" "%RazerT%" 2>nul
if %errorlevel% equ 0 (
    echo Razer Turbo mode Is Activated
)

findstr /C:"MacroClient:Delete" "%Razer4%" 2>nul
if %errorlevel% equ 0 (
    echo Detected a Deleted Razer Macro
)

if exist "%Razer1%" (
    for %%A in ("%Razer1%") do (
        echo %d%Razer mouse detected, Modified at: %%~tA
    ) 
)

if exist "%Razer2%" (
    for %%A in ("%Razer2%") do (
        echo %d%Razer mouse detected, Modified at: %%~tA
    ) 
)

if exist "%Razer3%" (
    for %%A in ("%Razer3%") do (
        echo %d%Razer mouse detected, Razer Synapse Opened/Modified at: %%~tA
    ) 
)

if exist "%Logitech%" (
    for %%A in ("%Logitech%") do (
        echo %d%Logitech mouse detected, Modified at: %%~tA
    )
    
)

if exist "%Glorious%" (
    for %%A in ("%Glorious%") do (
        echo Glorious mouse detected, Modified at: %%~tA
         )
    )

if exist "%corsair%" (
    for %%A in ("%corsair%") do (
    echo Corsair mouse detected, Modified at: %%~tA
     )
)
if exist "%bloody%" (
    for %%A in ("%bloody%") do (
        echo Bloody mouse detected, Modified at: %%~tA
    )
)

if exist "%steel%" (
    for %%A in ("%steel%") do (
        echo SteelSeries mouse detected, Modified at: %%~tA
    )
)

if exist "%Steel1%" (
     for %%A in ("%Steel1%") do ( 
     echo SteelSeries Mouse detected, Modified at: %%~tA
     )
)

if exist "%Alienware%" (
    for %%A in ("%Alienware%") do (
        echo Alienware mouse detected, Modified at: %%~tA
    )
)
if exist "%Motospeed%" (
    for %%A in ("%Motospeed%") do (
        echo Motospeed mouse detected, Modified at: %%~tA
    )
)

if exist "%Marsgaming%" (
    for %%A in ("%Marsgaming%") do (
        echo Marsgaming mouse detected, Modified at: %%~tA
    )
)

if exist "%Marsgaming2%" (
    for %%A in ("%Marsgaming2%") do (
        echo Marsgaming mouse detected, Modified at: %%~tA
    )
)

if exist "%Ayax%" (
 for %%A in ("%Ayax%") do (
        echo Ayax mouse detected, Modified at: %%~tA
    )
)

if exist "%T2%" (
 for %%A in ("%T2%") do (
        echo T2 mouse detected, Modified at: %%~tA
    )
)

if exist "%Xenon200%" (
    for %%A in ("%Xenon200%") do (
        echo Xenon200 mouse detected, Modified at: %%~tA
    )
)
if exist "%Reddragon%" (
    for %%A in ("%Reddragon%") do (
        echo RedDragon mouse detected, Modified at: %%~tA
    )
)

if exist "%Reddragon2%" (
    for %%A in ("%Reddragon2%") do (
        echo RedDragon mouse detected, Modified at: %%~tA
    )
)
if exist "%Reddragon3%" (
    for %%A in ("%Reddragon3%") do (
        echo RedDragon mouse detected, Modified at: %%~tA
    )
)

if exist "%Blackweb%" (
     for %%A in ("%Blackweb%") do (
        echo Blackweb mouse detected, Modified at: %%~tA
    )
)
echo Check finished
echo The User's Current time:%r% %date%\%TIME%
set folderPath=%appdata%\SS

if exist "%folderPath%" (
    rd /s /q "%folderPath%"
)
echo %c%Press any Button to Leave
pause>nul
