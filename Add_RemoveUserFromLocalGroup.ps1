

$domain = [Environment]::UserDomainName
$strComputer = "."

$username = [Environment]::UserName

$computer = [ADSI]("WinNT://" + $strComputer + ",computer")
$computer.name

$Group = $computer.psbase.children.find("administrators")
$Group.name

# This will list what’s currently in Administrator Group so you can verify the result

function ListAdministrators

{$members= $Group.psbase.invoke("Members") | %{$_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null)}
$members}
ListAdministrators

# Even though we are adding the AD account but we add it to local computer and so we will need to use WinNT: provider

$Group.Add("WinNT://" + $domain + "/" + $username)

ListAdministrators

$Group.Remove("WinNT://" + $domain + "/" + $username)

ListAdministrators