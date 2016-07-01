$ComputerList = Get-Content -Path C:\temp\WirelessGroupMachines.txt

Add-ADGroupMember "CFPB_Internal Wireless Test Group" -Members $ComputerList