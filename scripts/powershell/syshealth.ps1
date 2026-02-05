Write-Output "===== System Health Snapshot ====="
Write-Output "Date & Time: $(Get-Date)"
Write-Output "Hostname: $env:COMPUTERNAME"
Write-Output "Current User: $env:USERNAME"
Write-Output ""
Write-Output "Disk Usage (C: Drive):"

Get-PSDrive C | Select-Object Used, Free, @{Name="Total";Expression={$_.Used + $_.Free}}
