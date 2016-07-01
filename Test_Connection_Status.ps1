###########################################################################
#
# NAME: Ping List of Computers
#
# AUTHOR: J.Malek (www.malekjakir.com) Email: malek dot one zero four zero at gmail dot com
#
# COMMENT: This script can be used to ping a list of computers.
#
############################################################
 
$names = Get-Content "C:\PSTools\computers.txt"
foreach ($name in $names) {
if ( Test-Connection -ComputerName $name -Count 1 -ErrorAction SilentlyContinue ) {
Write-Host "$name is up" -ForegroundColor Magenta
}
else {
Write-Host "$name is down" -ForegroundColor Red
}
}