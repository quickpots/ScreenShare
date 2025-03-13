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
    Write-Host "===================="
}


function Process-Menu {
    param (
        [string]$Choice
    )
    switch($Choice) {
        '1' {
	    Get-ChildItem -Force 'C:\$Recycle.Bin'
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
        }   
        '2' {
	    Get-Service SysMain; Get-Service DiagTrack; Get-Service DPS; Get-Service PcaSvc; Get-Service BAM; Get-Service DNSCache; Get-Service AppInfo; Get-Service CDPUserSvc; Get-Service SGRMBroker; Get-Service EventLog
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
        }
        '4' {
	    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
	    Invoke-Expression (Invoke-RestMethod https://raw.githubusercontent.com/PureIntent/ScreenShare/main/RedLotusBam.ps1)
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
            Invoke-Expression (Invoke-RestMethod https://quickpots.fun/screenshare/tools/DMA.ps1)
	    Read-Host "press any button to continue"  
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
	}
       '7' {
	    cmd /c "fstuil usn readJournal C: csv > AllTheJournal.txt"
	    AllTheJournal.txt
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
	}		
        default {
            Write-Host "Invalid option, please try again."
        }
    }
}

Menu
$selection = Read-Host "Select an option"
Process-Menu -Choice $selection
