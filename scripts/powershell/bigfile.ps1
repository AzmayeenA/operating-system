param (
    [string]$FileName
)

if (-not (Test-Path $FileName)) {
    Write-Output "File does not exist."
    exit
}

$FileSize = (Get-Item $FileName).Length
$MaxSize = 1048576

if ($FileSize -gt $MaxSize) {
    Write-Output "Warning: File is too large"
} else {
    Write-Output "File size is within limits."
}