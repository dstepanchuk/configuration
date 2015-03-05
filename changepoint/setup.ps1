#-- Disable shutdown tracker
.\..\disable-windows-shutdown-event-tracker.ps1

#Import-Module Boxstarter.Chocolatey  does not work because we don't have an updated PsModulePath.

Import-Module $env:AppData\Boxstarter\Boxstarter.Chocolatey -DisableNameChecking
Install-BoxstarterPackage -PackageName $PSScriptRoot\boxstarter-script.ps1
