#-- Disable shutdown tracker
.\..\disable-windows-shutdown-event-tracker.ps1


#-- Import the boxstarter hook
Import-Module $env:AppData\Boxstarter\Boxstarter.Chocolatey -DisableNameChecking
#-- Start the Chocolatey package install

#-- win config
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar
Disable-InternetExplorerESC
Enable-RemoteDesktop
Disable-UAC
Set-TaskbarOptions -Size Small

#-- system
cinst -y powershell4

#-- utilities
#7zip is installed on the base image
cinst -y conemu
cinst -y curl
cinst -y ie11
cinst -y sysinternals
cinst -y sumatrapdf
cinst -y windirstat
cinst -y wireshark

#-- dev tools
cinst -y gitextensions
cinst -y dotpeek
cinst -y markdownpad2
cinst -y fiddler4
cinst -y linqpad4
cinst -y ilmerge
cinst -y nuget.commandline
cinst -y nugetpackageexplorer
cinst -y sublimetext3.app
cinst -y windbg


#-- install visual studio extensions
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
    $downloadLocation = Join-Path $downloads $_.Value.FileName
    $webclient.DownloadFile($_.Value.DownloadUrl, $downloadLocation)
    & $vsixInstaller /q $downloadLocation
}




#-- task bar items
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\ConEmu\ConEmu64.exe"
Install-ChocolateyPinnedTaskBarItem "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe"


#-- Install sublime text packages and user settings
Copy-Item "c:\hosthome\src\configuration\sublime-text\Package Control.sublime-settings" "$Env:UserProfile\AppData\Roaming\Sublime Text 3\Packages\User\Package Control.sublime-settings"
Copy-Item "c:\hosthome\src\configuration\sublime-text\Preferences.sublime-settings" "$Env:UserProfile\AppData\Roaming\Sublime Text 3\Packages\User\Preferences.sublime-settings"

#-- Install configuration files
Copy-Item c:\hosthome\src\configuration\changepoint\windows\.bashrc $Env:UserProfile\.bashrc
Copy-Item c:\hosthome\src\configuration\changepoint\windows\.gitconfig $Env:UserProfile\.gitconfig

