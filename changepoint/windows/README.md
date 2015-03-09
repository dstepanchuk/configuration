windows configuration
=====================
Files in this folder are specific to the Windows VM Dev PPM image.

# Files
## [setup.ps1](setup.ps1)
This Powershell script file starts the main vm customization process.  It's responsible for configuration options that aren't specific to [Boxstarter](http://boxstarter.org) such as configuring sublime text (after it is installed by [Chocolatey](http://chocolatey.org) and configuring up the bash prompt in Windows.  It also contains all the [cinst](https://github.com/chocolatey/choco/wiki/CommandsInstall) steps and packages.

## Tips
The Dev PPM vagrant file has a hidden hook for launching the wininit.cmd file from my personal files folder.  That file points at the [setup.ps1](setup.ps1) file in this repo, which contains all my user configurations.  Boxstarter is part of the default VM image.

## Sublime Text Packages
### Installation
Note: The files in https://github.com/dachew/configuration/tree/master/sublime-text contain the [Sublimetext PackageControl](https://packagecontrol.io/installation) script and default package list.  Sublime text will download and install any missing packages when it's first opened.  A restart of the editor might be required.

## Helpful Packages:
- [Indent XML](https://packagecontrol.io/packages/Indent%20XML)
- [Dayle Rees Color Schemes](https://packagecontrol.io/packages/Dayle%20Rees%20Color%20Schemes)
- [Git](https://packagecontrol.io/packages/Git)
- [Theme - Soda](https://packagecontrol.io/packages/Theme%20-%20Soda)

### TODO
Setup VS2012 packages via setup script(s)
- [Git Diff Margin](https://visualstudiogallery.msdn.microsoft.com/cf49cf30-2ca6-4ea0-b7cc-6a8e0dadc1a8)
  - Causes performance problems...
- [Git Source Control Provider](https://visualstudiogallery.msdn.microsoft.com/63a7e40d-4d71-4fbb-a23b-d262124b8f4c)
  - causes performance problems...
- [Git Extensions](https://visualstudiogallery.msdn.microsoft.com/8f594baa-e44e-4114-8381-e175ace0fe97)
- [Visual Studio Tools for Git](https://visualstudiogallery.msdn.microsoft.com/abafc7d6-dcaa-40f4-8a5e-d6724bdb980c)
- [Web Essentials 2012](https://visualstudiogallery.msdn.microsoft.com/07d54d12-7133-4e15-becb-6f451ea3bea6)
- [VsCommands](https://visualstudiogallery.msdn.microsoft.com/a83505c6-77b3-44a6-b53b-73d77cba84c8)
- [NuGet Package Manager](https://visualstudiogallery.msdn.microsoft.com/27077b70-9dad-4c64-adcf-c7cf6bc9970c)

