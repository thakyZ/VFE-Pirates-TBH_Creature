param()

$ModName = "VFE - Pirates - TBH Creature"

Remove-Item -Recurse -Path "${PSScriptRoot}\build"
New-Item -ItemType Directory -Path "${PSScriptRoot}\build"
New-Item -ItemType Directory -Path "${PSScriptRoot}\build\${ModName}"
Get-ChildItem -Path "${PSScriptRoot}\src" -Depth 0 | ForEach-Object {
  Copy-Item -Path $_.FullName -Recurse -Destination "${PSScriptRoot}\build\${ModName}"
}
$Has7zip = ($null -ne (Get-Command -Name 7z.exe -ErrorAction SilentlyContinue))
if ($Has7zip) {
  $7zipPath = (Get-Command -Name 7z.exe -ErrorAction SilentlyContinue).Source
  & "${7zipPath}" "a" "${PSScriptRoot}\${ModName}.zip" "${PSScriptRoot}\Build\${ModName}"
}