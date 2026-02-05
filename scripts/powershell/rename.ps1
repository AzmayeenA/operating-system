Get-ChildItem *.txt | ForEach-Object {
    Rename-Item $_.Name ("OLD_" + $_.Name)
}

Write-Output "All .txt files have been renamed."
