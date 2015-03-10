#-- Import the boxstarter hook
Import-Module $env:AppData\Boxstarter\Boxstarter.Chocolatey -DisableNameChecking

#-- system
cinst -y powershell4

#-- utilities
#7zip is installed on the base image
#cinst -y conemu
cinst -y curl
cinst -y ie11
cinst -y sysinternals
#cinst -y sumatrapdf
#cinst -y windirstat
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
#cinst -y windbg


#-- task bar items
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\ConEmu\ConEmu64.exe"
Install-ChocolateyPinnedTaskBarItem "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe"
