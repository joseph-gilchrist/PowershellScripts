
Copy-Item $PSScriptRoot"\owa.ico" C:\Windows\System32

$shortcut_name = "Outlook Web Access"
$shortcut_target = "C:\Program Files (x86)\Internet Explorer\iexplore.exe"
$shortcut_arg = "https://mail.cfpb.local"
$sh = New-Object -ComObject "WScript.Shell"
$p = $sh.SpecialFolders.item("AllUsersDesktop")
$lnk = $sh.CreateShortcut((Join-Path $p $shortcut_name)+".lnk")
$lnk.TargetPath = $shortcut_target
$lnk.Arguments = $shortcut_arg
$lnk.IconLocation = "C:\Windows\System32\owa.ico"
$lnk.Save()