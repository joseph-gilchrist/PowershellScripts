﻿(Get-Content "C:\temp\WirelessGroupMachines.txt") | foreach { $_ + '$' } | Set-Content "C:\Temp\WirelessGroupMachines.txt"