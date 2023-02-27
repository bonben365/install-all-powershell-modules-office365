    $Module=Get-InstalledModule -Name ExchangeOnlineManagement -MinimumVersion 2.0.3 -ErrorAction:SilentlyContinue
    if($Module.count -eq 0)
    {
     Write-Host Required Exchange Online'(EXO V2)' module is not available  -ForegroundColor yellow 
     $Confirm= Read-Host Are you sure you want to install module? [Y] Yes [N] No
     if($Confirm -match "[yY]")
     {
##Add Repopsitory
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
Install-PackageProvider -Name NuGet -Force
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

##Install module
Install-Module -Name ExchangeOnlineManagement -Force
     }
     else
     {
      Write-Host EXO V2 module is required to connect Exchange Online.Please install module using Install-Module ExchangeOnlineManagement cmdlet.
     }
    }

