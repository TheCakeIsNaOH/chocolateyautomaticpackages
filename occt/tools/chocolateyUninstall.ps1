Get-Process -Name occt* -ErrorAction SilentlyContinue | Stop-Process -ErrorAction SilentlyContinue
$icon_name = (Get-ChildItem "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs" -Filter "OCCT.lnk" -ErrorAction SilentlyContinue).FullName
Remove-Item $icon_name -ErrorAction SilentlyContinue
