# PowerShell script to download and execute a .cmd script from GitHub

echo "Downloading script at env:temp"

# URL to the raw .cmd script on GitHub
$scriptUrl = ""

# Path to save the downloaded script locally
$localScriptPath = "$env:TEMP\irmexectest.cmd"

# Download the script using Invoke-RestMethod
Invoke-RestMethod -Uri $scriptUrl -OutFile $localScriptPath

# Execute the downloaded .cmd script
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $localScriptPath" -Wait
