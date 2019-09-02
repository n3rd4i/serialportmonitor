$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://downloads.sourceforge.net/project/serial-port-monitor/Serial%20Port%20Monitor%20v1.2.1/Serial%20Port%20Notifier%20v1.2.1.exe' # download url, HTTPS preferred
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'serialportmonitor*'
  checksum      = '451B3C8124CDF6F95E85236DF55C9D7B972E6800C99E2B6235B2DA4CC137D049'
  checksumType  = 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
}

Install-ChocolateyPackage @packageArgs
