# PowerShell script to download and execute a .cmd script from GitHub
@echo off

echo "Downloading script at env:temp"

where node >nul 2>nul
if %ERRORLEVEL% equ 0 (
    echo Node.js is installed.
    node -v
) else (
    echo Node.js is not installed.
)


# URL to the raw .cmd script on GitHub
$scriptUrl = "https://raw.githubusercontent.com/tjwhang/IRM-APITest/refs/heads/main/code/main.cmd"

# Path to save the downloaded script locally
$localScriptPath = "$env:TEMP\irmexectest.cmd"

# Download the script using Invoke-RestMethod
Invoke-RestMethod -Uri $scriptUrl -OutFile $localScriptPath

# Execute the downloaded .cmd script
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $localScriptPath" -Wait

Remove-Item -Path $localScriptPath -Force
