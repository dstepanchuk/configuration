#-- Disable shutdown tracker
.\..\..\disable-windows-shutdown-event-tracker.ps1


#-- Import the boxstarter hook
Import-Module $env:AppData\Boxstarter\Boxstarter.Chocolatey -DisableNameChecking
#-- Start the Chocolatey package install


#-- win config
Set-WindowsExplorerOptions -DisableShowHiddenFilesFoldersDrives -DisableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar
Disable-InternetExplorerESC
Enable-RemoteDesktop
Disable-UAC
Set-TaskbarOptions -Size Small

#-- win packages
.\win-packages.ps1

#-- install visual studio extensions
.\vs-extensions.ps1


#-- Install sublime text packages and user settings
Copy-Item "c:\hosthome\src\configuration\sublime-text\Package Control.sublime-settings" "$Env:UserProfile\AppData\Roaming\Sublime Text 3\Packages\User\Package Control.sublime-settings"
Copy-Item "c:\hosthome\src\configuration\sublime-text\Preferences.sublime-settings" "$Env:UserProfile\AppData\Roaming\Sublime Text 3\Packages\User\Preferences.sublime-settings"

#-- Install configuration files
Copy-Item c:\hosthome\src\configuration\changepoint\windows\.bashrc $Env:UserProfile\.bashrc
Copy-Item c:\hosthome\src\configuration\changepoint\windows\.gitconfig $Env:UserProfile\.gitconfig

