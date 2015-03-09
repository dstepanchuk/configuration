#-- Disable shutdown tracker
.\..\disable-windows-shutdown-event-tracker.ps1

#Import-Module Boxstarter.Chocolatey  does not work because we don't have an updated PsModulePath.

Import-Module $env:AppData\Boxstarter\Boxstarter.Chocolatey -DisableNameChecking
Install-BoxstarterPackage -PackageName $PSScriptRoot\boxstarter-script.ps1


#-- Install sublime text packages and user settings
Copy-Item "c:\hosthome\src\configuration\sublime-text\Package Control.sublime-settings" "$Env:UserProfile\AppData\Roaming\Sublime Text 3\Packages\User\Package Control.sublime-settings"
Copy-Item "c:\hosthome\src\configuration\sublime-text\User-Preferences.sublime-settings" "$Env:UserProfile\AppData\Roaming\Sublime Text 3\Packages\User\Preferences.sublime-settings"

#-- Install configuration files
Copy-Item c:\hosthome\src\configuration\changepoint\windows\.bashrc $Env:UserProfile\.bashrc
Copy-Item c:\hosthome\src\configuration\changepoint\windows\.gitconfig $Env:UserProfile\.gitconfig

