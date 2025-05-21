# ScreenShare
ScreenSharing tools


# How to use:

## CSRSS Scan:

1. dump csrss with the lower private bytes

```
powershell Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass && powershell Invoke-Expression (Invoke-RestMethod https://raw.githubusercontent.com/QuickPots/ScreenShare/main/CSRSS.ps1)
```
