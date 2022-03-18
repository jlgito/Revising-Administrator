# Nommer Interfaces - Pas besoin sur du mono-interface
Rename-Computer -NewName SRV-03
# Configuration IP

netsh int ip set ad "Ethernet" static 192.168.128.1 255.255.255.0 192.168.8.254
  


# Nommer Correctement Windows
# Le restart sera fait en fin de Configuration


# Config Pare-Feu

Get-NetFirewallRule -Name "*ICMP4-ERQ-In*" | Enable-NetFirewallRule 
Get-NetFirewallRule -Name "*ICMP4-ERQ-Out*" | Enable-NetFirewallRule 

# Installer RÃ´le(s)
# Si plusieurs RÃ´les, il faut les faire un par un...

Install-WindowsFeature -Name DNS -IncludeManagementTools
Get-DnsServer
Add-DnsServerPrimaryZone -Name "asrc.local" -ZoneFile "asrc.local.dns"
Add-DnsServerForwarder -IPAddress 8.8.8.8 -PassThru


Install-WindowsFeature -Name DNS -IncludeManagementTools
Get-DnsServer
Add-DnsServerPrimaryZone -Name "devs.asrc.local" -ZoneFile "devs.asrc.local.dns"
Add-DnsServerPrimaryZone -Name "asrc.devs" -ZoneFile "asrc.devs.dns"
Add-DnsServerPrimaryZone -NetworkID 192.168/16 -ZoneFile "168.192.in-addr.arpa.dns"
Add-DnsServerResourceRecordA -Name equipier2 -ZoneName devs.asrc.local -IPv4Address 192.168.128.1
Add-DnsServerForwarder -IPAddress 8.8.8.8 -PassThru







# Reboot on laisse un -Confirm au dÃ©but, histoire d'analyser d'Ã©ventuelles erreurs,
# une fois que l'on est sÃ»r de son coup, on peut le passer en commentaire

Restart-Computer 

