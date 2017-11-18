﻿$ErrorActionPreference = 'Stop'
 
$packageName = 'ecm'
$url32       = 'https://www.sordum.org/files/easy-context-menu/ec_menu.zip'
$checksum32  = 'b02c9ef742ca075a4d3d979ed20c77acf3db6b0e3b61fa94db2511a219b64c77'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition
$options =
@{
  Headers = @{
    'GET' = 'http://www.sordum.org/files/easy-context-menu/ec_menu.zip HTTP/1.1'
    'Accept' = 'text/html, application/xhtml+xml, image/jxr, */*'
    'Referer'= 'http://www.sordum.org/downloads/?easy-context-menu'
    'Accept-Language'= 'de-DE,de;q=0.5'
    'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko'
    'Accept-Encoding' = 'gzip, deflate'
    'Pragma' = 'no-cache'
    'DNT' = '1'
  }
}
 
$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs -options $options

$FileFullPath = get-childitem $toolsPath -Recurse -Filter "EcMenu*" -include *.exe | select -First 2

$bits = Get-ProcessorBits
if ($bits -eq 64)
{
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Easy Context Menu.lnk" $FileFullPath[1]
}
else
{
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Easy Context Menu.lnk" $FileFullPath[0]
}
