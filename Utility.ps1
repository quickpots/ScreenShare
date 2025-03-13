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
    Write-Host "1.  Service Check"
    Write-Host "2.  BAM"
    Write-Host "3.  Analyse Prefetch"
    Write-Host "4   Scheduler Checks"
    Write-Host "5.  DMA Checks"
    Write-Host "6.  Fsutil"
    Write-Host "===================="
}


function Process-Menu {
    param (
        [string]$Choice
    )
    switch($Choice) {
        '1' {
            get-service | findstr -i "pcasvc"; get-service | findstr -i "DPS"; get-service | findstr -i "Diagtrack"; get-service | findstr -i "sysmain"; get-service | findstr -i "eventlog"; get-service | findstr -i "sgrmbroker": get-service | findstr -i "cdpusersvc"
	    Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
        }
        '2' {
	    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
            Invoke-Expression (Invoke-RestMethod https://raw.githubusercontent.com/PureIntent/ScreenShare/main/RedLotusBam.ps1)
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
        }
        '3' {
            Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
            Invoke-Expression (Invoke-RestMethod https://raw.githubusercontent.com/bacanoicua/Screenshare/main/RedLotusPrefetchIntegrityAnalyzer.ps1)
	    Read-Host "press any button to continue"  
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection	    
        }
       '4' {
            Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
            Invoke-Expression (Invoke-RestMethod https://raw.githubusercontent.com/nolww/project-mohr/refs/heads/main/ManualTasks.ps1)
	    Read-Host "press any button to continue"  
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
	}
       '5' {
            Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
            Invoke-Expression (Invoke-RestMethod https://quickpots.fun/screenshare/tools/DMA.ps1)
	    Read-Host "press any button to continue"  
            Clear-Host
            Menu
            $selection = Read-Host "Select an option"
            Process-Menu -Choice $selection
	}
       '6' {
	    cmd /c "fsutil usn readJournal C: csv > AllTheJournal.txt"
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
