#Import-Module -Name 'C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\bin\ConfigurationManager.psd1'

$UserList = Get-Content -Path C:\temp\Wirelessgroup.txt

Get-CMUserDeviceAffinity -UserName $UserList | Format-List -Property ResourceName > C:\Temp\WirelessGroupMachines.txt