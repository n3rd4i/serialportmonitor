$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://netix.dl.sourceforge.net/project/serial-port-monitor/Serial%20Port%20Monitor%20v1.1.2/Serial%20Port%20Monitor%20v1.1.2.exe' # download url, HTTPS preferred
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  url           = $url
  softwareName  = 'serialportmonitor*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = '0FFA5D41862094CCA7AF59F169C968BF'
  checksumType  = 'md5' #default is md5, can also be sha1, sha256 or sha512
  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package

