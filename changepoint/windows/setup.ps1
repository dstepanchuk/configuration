#-- Disable shutdown tracker
Invoke-Expression (Join-Path $PSScriptRoot .\disable-windows-shutdown-event-tracker.ps1)


#-- Import the boxstarter hook
Import-Module $env:AppData\Boxstarter\Boxstarter.Chocolatey -DisableNameChecking
#-- Start the Chocolatey package install


#-- win config
Set-WindowsExplorerOptions -DisableShowHiddenFilesFoldersDrives -DisableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar
Disable-InternetExplorerESC
Enable-RemoteDesktop
Disable-UAC
Set-TaskbarOptions -Size Small


#-- utilities
cinst -y curl
cinst -y ie11
cinst -y sysinternals


#-- dev tools
cinst -y gitextensions
cinst -y markdownpad2
cinst -y fiddler4
cinst -y linqpad4
cinst -y nuget.commandline
cinst -y nugetpackageexplorer
cinst -y sublimetext3.app


#-- install visual studio extensions
Invoke-Expression (Join-Path $PSScriptRoot '.\vs-extensions.ps1')


#-- Install sublime text packages and user settings
Copy-Item "c:\hosthome\src\configuration\sublime-text\Package Control.sublime-settings" "$Env:UserProfile\AppData\Roaming\Sublime Text 3\Packages\User\Package Control.sublime-settings"
Copy-Item "c:\hosthome\src\configuration\sublime-text\Preferences.sublime-settings" "$Env:UserProfile\AppData\Roaming\Sublime Text 3\Packages\User\Preferences.sublime-settings"


#-- Install configuration files
Copy-Item c:\hosthome\src\configuration\changepoint\windows\.bashrc $Env:UserProfile\.bashrc
Copy-Item c:\hosthome\src\configuration\changepoint\windows\.gitconfig $Env:UserProfile\.gitconfig


#-- task bar items
#Install-ChocolateyPinnedTaskBarItem "$env:programfiles\ConEmu\ConEmu64.exe"
#Install-ChocolateyPinnedTaskBarItem "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe"
