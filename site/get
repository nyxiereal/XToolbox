# This is a script to download the latest version of XToolbox from the GitHub repository.

$url = "https://github.com/nyxiereal/XToolbox/releases/latest/download/XTBox.exe"

$output = "XTBox.exe"

Invoke-WebRequest -Uri $url -OutFile $output

Start-Process -FilePath $output -Wait