#-- make sure the key is present
if ( -Not (Test-Path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability'))
{
	New-Item -Path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT' -Name Reliability -Force
}

#-- Set the ShutdownReasonOn value
Set-ItemProperty -Path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability' -Name ShutdownReasonOn -Value 0

#-- Remove the ShutdownReasonUI value
if ( -Not (Test-Path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability'))
{
	Remove-ItemProperty -Path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability' -Name ShutdownReasonUI
}

