setup-windows
=============
This repo shamelessly copied from https://github.com/drewburlingame/setup-windows

### scripts to setup a base windows image


these scripts use http://boxstarter.org to install chocolatey packages and modify settings on the machine

Run the following from a cmd prompt to install run the changepoint setup script for my dev machine:
```cmd
START http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/dachew/setup-windows/master/changepoint/setup
```

### TODO
Setup VS2012 packages via setup script(s)
- GitEx for Visual Studio
- Git Diff Margin for VS
- Visual Studio Tools for Git
- Markdown editor?


review these chocolatey packages for ideas
http://chocolatey.org/packages/EthanBrown.DevTools.Web
http://chocolatey.org/packages/jivkok.dev1
http://chocolatey.org/packages/jivkok.Shell1
http://chocolatey.org/packages?q=boxstarter
