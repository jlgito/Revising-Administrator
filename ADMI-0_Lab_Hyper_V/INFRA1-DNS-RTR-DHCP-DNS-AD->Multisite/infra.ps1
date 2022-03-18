$compteur = [int]0

function Installhyperv {
#Installer la fonctionnalité d'hyper-V
Write-Host ("Je suis bien ton premier essai ")#Test d'essai facultative durant la phase de preproductione                                      #Création d'un fichier dans le repertoire demarrer avec un comtpeur deja a un .                                                #Le compteur tombera a un automatiquement car j'ai
#Add-WindowsFeature Hyper-V-Tools
#Add-WindowsFeature Hyepr-V-Powershell 
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart
Restart-Computer


}
function Partionnement {
    #Partionement automatique 
    Write-Host ("Je suis bien ton second essai ")
    Resize-Partition -DiskNumber 0 -PartitionNumber 4 -Size (100GB) 
    New-Parttion -DiskNumber 0 -UseMaximumSize -DriverLetter F Permet de configurer une partition avec la lettre 
    Format-Volume -DriveLetter F -FileSystem NTFS 

}
function Réecriturehyperv {
    #Création des repertoires 
    Write-Host ("Je suis bien ton 3ième essai ")
    New-Item F:/Baseref -Directory
    New-Item F:/Base -Directory
    New-Item F:/VMS -Directory
    New-Item F:/VHD -Directory
    New-Item F:/VMS/SRV-01 -Directory
    New-Item F:/VMS/SRV-02 -Directory 
    New-Item F:/VMS/SRV-03 -Directory 
    New-Item F:/VMS/CLI-01 -Directory 
    New-Item F:/VMS/CLI-02 -Directory 
    New-Item F:/VMS/CLI-03 -Directory 
    New-Item F:/VMS/RTR-01 -Directory 
    New-Item F:/VMS/RTR-02 -Directory
    New-Item F:/VMS/RTR-03 -Directory
    New-Item F:/VHD/SRV-01 -Directory
    New-Item F:/VHD/SRV-02 -Directory 
    New-Item F:/VHD/SRV-03 -Directory 
    New-Item F:/VHD/CLI-01 -Directory 
    New-Item F:/VHD/CLI-02 -Directory 
    New-Item F:/VHD/CLI-03 -Directory 
    New-Item F:/VHD/RTR-01 -Directory 
    New-Item F:/VHD/RTR-02 -Directory
    New-Item F:/VHD/RTR-03 -Directory

}
function Switchs {
   #Création des commutateur virtuelles 
    New-VMSwitch  -Name "Arc-SRV" -SwitchType Private 
    New-VMSwitch  -Name  "Arc-CLI" -SwitchType Private 
    New-VMSwitch  -Name "WAN" -SwitchType Private 
    New-VMSwitch  -Name "Bou-LAN" -SwitchType Private
    New-VMSwitch  -Name "PHYSIQUE" -SwitchType Private  


}
function Vms {
    Write-Host ("Je suis bien ton 4ième essai ")
    #Création des machines virtuelles 
    New-VM -Name SRV-01 -MemoryStartupBytes 2GB  -Path .\VMData  -Generation 2 -Switch Arc-SRV
    New-VM -Name SRV-02 -MemoryStartupBytes 2GB  -Path .\VMData  -Generation 2 -Switch Arc-SRV
    New-VM -Name SRV-03 -MemoryStartupBytes 2GB  -Path .\VMData  -Generation 2 -Switch Bou-LAN
    New-VM -Name CLI-01 -MemoryStartupBytes 2GB  -Path .\VMData  -Generation 2 -Switch Arc-CLI
    New-VM -Name CLI-02 -MemoryStartupBytes 2GB  -Path .\VMData  -Generation 2 -Switch Arc-CLI
    New-VM -Name CLI-03 -MemoryStartupBytes 2GB  -Path .\VMData  -Generation 2 -Switch Bou-LAN
    New-VM -Name RTR-01 -MemoryStartupBytes 2GB  -Path .\VMData  -Generation 2 -Switch Arc-CLI,Arc-SRV,WAN
    New-VM -Name RTR-01 -MemoryStartupBytes 2GB  -Path .\VMData  -Generation 2 -Switch Bou-LAN,WAN
    New-VM -Name RTR-03 -MemoryStartupBytes 2GB  -Path .\VMData  -Generation 2 -Switch WAN,PHYISIQUE
} 


function Bases {
    Write-Host ("Je suis bien ton 4ième essai ")
    #Création et configuration automatique de mes bases 



} 
function DiffVHD {
    #Création des machines de differenciation 
    New-VHD -ParentPath F:\Base\BaseSRV.vhdx -Path F:\SRV01\DiffSRV-01.vhdx -Differencing
    New-VHD -ParentPath F:\Base\BaseSRV.vhdx -Path F:\SRV02\DiffSRV-02.vhdx -Differencing
    New-VHD -ParentPath F:\Base\BaseSRV.vhdx -Path F:\SRV03\DiffSRV-03.vhdx -Differencing
    New-VHD -ParentPath F:\Base\BaseCLI.vhdx -Path F:\CLI01\DiffCLI-01.vhdx -Differencing
    New-VHD -ParentPath F:\Base\BaseCLI.vhdx -Path F:\CLI02\DiffCli-02.vhdx -Differencing
    New-VHD -ParentPath F:\Base\BaseCLI.vhdx -Path F:\CLI03\DiffCli-03.vhdx -Differencing
    New-VHD -ParentPath F:\Base\BaseSRV.vhdx -Path F:\RTR-01\DiffRTR-01.vhdx -Differencing
    New-VHD -ParentPath F:\Base\BaseSRV.vhdx -Path F:\RTR02\DiffRTR-02.vhdx -Differencing
    New-VHD -ParentPath F:\Bases\BaseSRV.vhdx -Path F:\RTR03\DiffRTR-03.vhdx -Differencing

} 
function StartVMs {
    #Demarrage finale de machines virtuelles 
    Start-VM -Name SRV-01 
    Start-VM -Name SRV-02 
    Start-VM -Name SRV-03
    Start-VM -Name CLI-01 
    Start-VM -Name CLI-02 
    Start-VM -Name CLI-03
    Start-VM -Name RTR-01 
    Start-VM -Name RTR-01 
    Start-VM -Name RTR-03 
} 

try {
While ($compteur -lt 7) {
    
    If($compteur -lt 1)
    {
        Installhyperv
        $compteur++
    }
    elseif ($compteur -lt 2) {
    
        Partionnement
        $compteur++
            
    }
    elseif ($compteur -lt 3) {
        Réecriturehyperv
        Read-Host " Wrong `n Do you want another guess? (Y/N) 3"
        $compteur++   
    }
    elseif ($compteur -lt 4) {
      Switchs   
      $compteur++  
    }
    elseif ($compteur -lt 5) {
        Vms 
        $compteur++    
      }
      elseif ($compteur -lt 6) {
        DiffVHD 
        $compteur++   
      }
      elseif ($compteur -lt 6) {
        StartVMs
        $compteur++   
      }
} 
