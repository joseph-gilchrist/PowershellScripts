Test-RegistryValue -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client' -Value 'Enabled'


function Test-RegistryValue {

param (

 [parameter(Mandatory=$true)]
 [ValidateNotNullOrEmpty()]$Path,

[parameter(Mandatory=$true)]
 [ValidateNotNullOrEmpty()]$Value
)

try {

Get-ItemProperty -Path $Path | Select-Object -ExpandProperty $Value -ErrorAction Stop | Out-Null
 return $true
 }

catch {

return $false

}

}








#Push-Location
#sl HKLM:\SYSTEM; if(Test-Path "CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client"){$True}ELSE{$False}
#Pop-Location

