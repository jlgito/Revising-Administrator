$vms = 'bz1-vm1','bz1-vm2','bz1-vm3','bz1-vm4','bz1-vm5','bz1-vm6','bz1-vm7','bz1-vm8'


foreach ($createvm in $vms)
{
    Write-Host("Lam achien ",$createvm) r`
    New-AzVM -RessourceGroupName essai C:\AMD
    -Location Europe-Central
    -Name $createvm
    -VirtualNetworkName 
    -AddressPrefix
    


}
Write-Host("Les machines virtuelless sont toutes pretes !")
