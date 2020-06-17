$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = 'https://downloads.sourceforge.net/project/serial-port-monitor/Serial%20Port%20Monitor%20v1.2.2/Serial%20Port%20Notifier%20v1.2.2.exe'
  softwareName  = 'serialportmonitor*'
  checksum      = 'DC808383C773152DD14E2EC1394BE4D5F3302B40CE906004892E06A7F3E5F15D'
  checksumType  = 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
}
Install-ChocolateyPackage @packageArgs
