#-- win config
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar
Disable-InternetExplorerESC
Enable-RemoteDesktop
Disable-UAC
Set-TaskbarOptions -Size Small

#-- system
cinst powershell4

#-- utilities
#7zip is installed on the base image
cinst conemu
cinst curl
cinst ie11
cinst sysinternals
cinst sumatrapdf
cinst windirstat
cinst wireshark

#-- dev tools
cinst gitextensions
cinst dotpeek
cinst markdownpad2
cinst fiddler4
cinst linqpad4
cinst ilmerge
cinst nuget.commandline
cinst nugetpackageexplorer
cinst sublimetext3.app
cinst windbg


#-- task bar items
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\ConEmu\ConEmu64.exe"
Install-ChocolateyPinnedTaskBarItem "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe"

