
$COMPUTERS = get-content C:\Temp\Computers.txt
$COMPUTERS|Foreach {Get-ADComputer $_ | Move-ADObject -TargetPath "OU=Obsolete Computer Accounts,DC=cfpb,DC=local" } 