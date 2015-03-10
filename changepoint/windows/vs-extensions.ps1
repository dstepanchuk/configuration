$wininitPath = $PSScriptRoot

#
# Download and reference NuGet packages
#
Write-BoxstarterMessage 'Download and reference NuGet packages'
$tempPackages = Join-Path $env:TEMP ((Get-Date).Ticks)
NuGet.exe install -x Newtonsoft.Json -OutputDirectory $tempPackages
Add-Type -Path (Join-Path $tempPackages 'Newtonsoft.Json\lib\net40\Newtonsoft.Json.dll')

#
# Install Visual Studio extensions
#
Write-BoxstarterMessage 'Install Visual Studio extensions'
$vsextensions =
    Get-Content (Join-Path $wininitPath 'vs-extensions.json') -Raw |
    ConvertFrom-Json
$vsixInstaller = Join-Path $env:VS110COMNTOOLS '..\IDE\VSIXInstaller.exe'
$downloads = Join-Path $HOME 'Downloads'
$webclient = New-Object System.Net.WebClient
$vsextensions.PSObject.Properties | ForEach-Object {
    $msg = 'Installing VS package ' + $($_.Value.Package)
    Write-BoxstarterMessage $msg
    $downloadLocation = Join-Path $downloads $_.Value.FileName
    $webclient.DownloadFile($_.Value.DownloadUrl, $downloadLocation)
    & $vsixInstaller /q $downloadLocation
}
