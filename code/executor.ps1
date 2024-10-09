# PowerShell script to download and execute a .cmd script from GitHub

Write-Host "Welcome to IRM to nodejs test program"
Write-Host "Checking for Node.js installation..."

try {
    # Try to get the Node.js command
    $nodeCommand = Get-Command node -ErrorAction Stop
    Write-Host "Node.js is installed."
    # Get the Node.js version
    node -v
} catch {
    Write-Host "Node.js is not installed. Installing... Please "
    winget install OpenJS.NodeJS
}

Write-Host "Downloading script at env:temp"

# URL to the raw .cmd script on GitHub
$scriptUrl = "https://raw.githubusercontent.com/tjwhang/IRM-APITest/refs/heads/main/code/main.cmd"

# Path to save the downloaded script locally
$localScriptPath = "$env:TEMP\irmexectest.cmd"

# Download the script using Invoke-RestMethod
Invoke-RestMethod -Uri $scriptUrl -OutFile $localScriptPath

# Execute the downloaded .cmd script
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $localScriptPath" -Wait

Remove-Item -Path $localScriptPath -Force
