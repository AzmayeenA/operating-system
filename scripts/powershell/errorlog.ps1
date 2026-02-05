$LogFile = "server.log"

if (-not (Test-Path $LogFile)) {
    Write-Output "Log file not found."
    exit
}

$Count = Select-String -Path $LogFile -Pattern "Error" | Measure-Object
Write-Output "Number of lines containing 'Error': $($Count.Count)"
