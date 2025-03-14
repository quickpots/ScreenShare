Clear-Host
function Menu {
    param (
        [string]$Title = @'
           _                       _    _ _   _ _ _ _         
     /\   | |                     | |  | | | (_) (_) |        
    /  \  | |_   _  __ _ ________ | |  | | |_ _| |_| |_ _   _ 
   / /\ \ | | | | |/ _` |_  /_  / | |  | | __| | | | __| | | |
  / ____ \| | |_| | (_| |/ / / /  | |__| | |_| | | | |_| |_| |
 /_/    \_\_|\__, |\__,_/___/___|  \____/ \__|_|_|_|\__|\__, |
              __/ |                                      __/ |
             |___/                                      |___/ 
                                                                                                                         
                                                                
'@
    )
	Write-Host @"
           _                       _    _ _   _ _ _ _         
     /\   | |                     | |  | | | (_) (_) |        
    /  \  | |_   _  __ _ ________ | |  | | |_ _| |_| |_ _   _ 
   / /\ \ | | | | |/ _` |_  /_  / | |  | | __| | | | __| | | |
  / ____ \| | |_| | (_| |/ / / /  | |__| | |_| | | | |_| |_| |
 /_/    \_\_|\__, |\__,_/___/___|  \____/ \__|_|_|_|\__|\__, |
              __/ |                                      __/ |
             |___/                                      |___/ 	

                                                             
                                                                                           
"@																						   
    Write-Host "===================="
    Write-Host "  PC Checker Script "
    Write-Host "===================="
    Write-Host "1.  RecycleBin Check"	
    Write-Host "2.  Service Check"
    Write-Host "3.  BAM"
    Write-Host "4.  Analyse Prefetch"
    Write-Host "5.  Scheduler Checks"
    Write-Host "6.  DMA Checks"
    Write-Host "7.  Fsutil"
    Write-Host "8.  HardDiskVolume Converter"  
    Write-Host "9.  Signatures"  
    Write-Host "10. Alternate Data Streams"
    Write-Host "11. Serials"      
    Write-Host "===================="
}


function Process-Menu {
    param (
        [string]$Choice
    )
    switch($Choice) {
        '1' {
	    Get-ChildItem -Force 'C:\$Recycle.Bin'
            Read-Host "press any button to continue" 
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
        }   
        '2' {
	    Get-Service SysMain; Get-Service DiagTrack; Get-Service DPS; Get-Service PcaSvc; Get-Service BAM; Get-Service DNSCache; Get-Service AppInfo; Get-Service CDPUserSvc; Get-Service SGRMBroker; Get-Service EventLog
            Read-Host "press any button to continue" 
	    Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
        }
        '4' {
	    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
	    Invoke-Expression (Invoke-RestMethod https://raw.githubusercontent.com/PureIntent/ScreenShare/main/RedLotusBam.ps1)
            Read-Host "press any button to continue" 
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
        }
        '4' {
            Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
            Invoke-Expression (Invoke-RestMethod https://raw.githubusercontent.com/bacanoicua/Screenshare/main/RedLotusPrefetchIntegrityAnalyzer.ps1)
	    Read-Host "press any button to continue"  
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection	    
        }
       '5' {
            Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
            Invoke-Expression (Invoke-RestMethod https://raw.githubusercontent.com/nolww/project-mohr/refs/heads/main/ManualTasks.ps1)
	    Read-Host "press any button to continue"  
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
	}
       '6' {
            Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
            Invoke-Expression (Invoke-RestMethod https://quickpots.fun/screenshare/DMA.ps1)
	    Read-Host "press any button to continue"  
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
	}
       '7' {
	    cmd /c "fsutil usn readJournal C: csv > AllTheJournal.txt"
	    AllTheJournal.txt
            Read-Host "press any button to continue" 
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
	}	
        '8' {
            Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
            Invoke-Expression (Invoke-RestMethod https://raw.githubusercontent.com/bacanoicua/Screenshare/main/RedLotusHardDiskVolumeConverter.ps1)
	    Read-Host "press any button to continue"  
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
	}
        '9' {
            Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
            Invoke-Expression (Invoke-RestMethod https://raw.githubusercontent.com/bacanoicua/Screenshare/main/RedLotusSignatures.ps1)
	    Read-Host "press any button to continue"  
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
	} 
        '10' {
            Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
            Invoke-Expression (Invoke-RestMethod https://quickpots.fun/screenshare/ADS.ps1)
	    Read-Host "press any button to continue"  
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
	} 
        '11' {
            cmd /c  "wmic diskdrive get serialnumber"
	    cmd /c  "wmic VOLUME GET BlockSize,Capacity,DriveLetter,FileSystem,FreeSpace,IndexingEnabled,Label,MaximumFileNameLength"
            cmd /c "echo Motherboard (Base Board):"
	    cmd /c "wmic baseboard get serialnumber"
	    cmd /c "echo SMBios:"
            cmd /c "wmic path win32_computersystemproduct get uuid"
            cmd /c "echo MEMORY"
	    cmd /c "wmic MEMORYCHIP GET BankLabel,DataWidth,Manufacturer,PartNumber,Capacity,Speed,TypeDetail"
	    cmd /c "echo GPU"
            cmd /c "wmic PATH Win32_videocontroller GET AdapterRAM,CurrentRefreshRate,Description,DriverVersion,VideoModeDescription"
            cmd /c "echo Bios: & wmic csproduct get uuid"
	    cmd  /c "echo CPU (Processor):"
            cmd /c "wmic cpu get processorid, caption, deviceid, name"
	    cmd /c "echo Mac Address:"
            cmd /c "getmac"
	    cmd /c "echo System:"
            cmd /c "wmic OS GET Caption,CodeSet,CSName,InstallDate,Locale,NumberOfProcesses,OSArchitecture,SerialNumber,SystemDirectory,Version"
	    cmd /c "echo Startup programs:"
            cmd /c "wmic STARTUP GET Caption,Command,Location"
	    Read-Host "press any button to continue" 
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
	}  
        default {
            Write-Host "Invalid option, please try again."
	    Menu
            $selection = Read-Host "Select an option"
	    Process-Menu -Choice $selection

        }
    }
}

Menu
$selection = Read-Host "Select an option"
Process-Menu -Choice $selection
