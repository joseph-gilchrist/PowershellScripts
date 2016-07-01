Param([string]$filePath)

$cert=(dir cert:currentuser\my\ -CodeSigningCert)


Set-AuthenticodeSignature $filePath $cert -TimestampServer "http://timestamp.verisign.com/scripts/timstamp.dll"

