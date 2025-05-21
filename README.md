# ScreenShare
ScreenSharing tools


# How to use:

## CSRSS Scan:

1. dump csrss with the lower private bytes
2. filter for ``^[A-Z]:\\.+.exe$`` (Regex case-sensitive)
3. save the results to C:\ as "res1.txt"

4. dump the higher private byte version of csrss
5. filter for ``^[A-Z]:\\.+.dll$`` (Regex case-sensitive)
6. save the results to C:\ as "res2.txt"

7. open cmd as admin
8. run this:
```
powershell Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass && powershell Invoke-Expression (Invoke-RestMethod https://raw.githubusercontent.com/QuickPots/ScreenShare/main/CSRSS.ps1)
```

## Alt Checker:
1. open cmd as admin
2. run this:
```
powershell Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass && powershell Invoke-Expression (Invoke-RestMethod https://raw.githubusercontent.com/QuickPots/ScreenShare/main/MinecraftAccounts.ps1)
```

3. wait for results


## BAM Script:

## Alt Checker:
1. open cmd as admin
2. run this:
```
powershell Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass && powershell Invoke-Expression (Invoke-RestMethod https://raw.githubusercontent.com/QuickPots/ScreenShare/main/BAM.ps1)
```

3. check relevant dates
