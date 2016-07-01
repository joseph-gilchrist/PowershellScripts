
$Computers = Get-Content "C:\PSTools\Computers.txt"

(Get-WmiObject -ComputerName $Computers -Namespace root\DCIM\sysman -class DCIM_BIOSService).SetBIOSAttributes($null,$null,"WLAN Connection Auto Sense","1","ADMINPW_IFREQUIRED")

