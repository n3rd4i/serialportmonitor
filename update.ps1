import-module au

$domain   = 'https://sourceforge.net'
$releases = "$domain/projects/serial-port-monitor/files"

function global:au_SearchReplace {
  @{ 
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"   	= "`$1'$($Latest.Checksum32)'"
    }
  }
}

# /projects/serial-port-monitor/files/Serial%20Port%20Monitor%20v1.2.2/
# https://sourceforge.net/projects/serial-port-monitor/files/Serial%20Port%20Monitor%20v1.2.2/
function global:au_GetLatest {
  $folders_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex = 'Serial%20Port%20Monitor%20v\d+.\d+.\d+'
  $folder = $folders_page.links | ? href -match $regex | select -First 1 -expand href
  $download_page = Invoke-WebRequest -Uri $(($domain, $folder) -Join('')) -UseBasicParsing
  $regex = '.exe'
  $url_file = $download_page.links | ? href -match $regex | select -First 1 -expand href
  $url = $url_file

  $token = $url_file -split 'Serial%20Port%20Notifier%20v' | select -First 1 -Skip 1
  $version = $token -split '.exe/download' | select -Last 1 -Skip 1
  return @{ Version = $version; URL32 = $url }
}

update -ChecksumFor 32
