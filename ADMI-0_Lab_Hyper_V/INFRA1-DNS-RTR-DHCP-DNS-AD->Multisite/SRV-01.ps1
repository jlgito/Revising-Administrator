# Nommer Interfaces - Pas besoin sur du mono-interface
Rename-Computer -NewName SRV-01
# Configuration IP

netsh int ip set ad "Ethernet" static 192.168.8.1 255.255.255.0 192.168.8.254
  


# Nommer Correctement Windows
# Le restart sera fait en fin de Configuration


# Config Pare-Feu

Get-NetFirewallRule -Name "*ICMP4-ERQ-In*" | Enable-NetFirewallRule 
Get-NetFirewallRule -Name "*ICMP4-ERQ-Out*" | Enable-NetFirewallRule 

# Installer RÃ´le(s)
# Si plusieurs RÃ´les, il faut les faire un par un...

Install-WindowsFeature -Name DHCP -IncludeManagementTools
Add-DhcpServerv4Scope -Name "Arc-CLI" -StartRange 192.168.12.1 -EndRange 192.168.12.254 -SubnetMask 255.255.255.0
Add-DhcpServerv4ExclusionRange -ScopeID 192.168.12.0 -StartRange 192.168.12.240 -EndRange 192.168.12.254
Add-DhcpServerv4ExclusionRange -ScopeID 192.168.12.0 -StartRange 192.168.12.1 -EndRange 192.168.12.10
Set-DhcpServerv4OptionValue -ScopeID 192.168.12.0 -OptionID 3 -Value 192.168.12.254
Set-DhcpServerv4OptionValue -ScopeID 192.168.12.0 -OptionID 6 -Value 192.168.8.1,192.168.128.1 -Force

Set-DhcpServerv4OptionValue -ScopeID 192.168.12.0 -OptionID 15 -Value asrc.local -Force

Add-DhcpServerv4Scope -Name "Bou-LAN" -StartRange 192.168.128.1 -EndRange 192.168.128.254 -SubnetMask 255.255.255.0
Add-DhcpServerv4ExclusionRange -ScopeID 192.168.128.0 -StartRange 192.168.128.1 -EndRange 192.168.128.10
Add-DhcpServerv4ExclusionRange -ScopeID 192.168.128.0 -StartRange 192.168.128.240 -EndRange 192.168.128.254
Set-DhcpServerv4OptionValue -ScopeID 192.168.128.0 -OptionID 3 -Value 192.168.128.254
Set-DhcpServerv4OptionValue -ScopeID 192.168.128.0 -OptionID 6 -Value 192.168.128.1,192.168.8.1 -Force

Set-DhcpServerv4OptionValue -ScopeID 192.168.128.0 -OptionID 15 -Value asrc.local -Force



Install-WindowsFeature -Name DNS -IncludeManagementTools
Get-DnsServer
Add-DnsServerPrimaryZone -Name "asrc.local" -ZoneFile "asrc.local.dns"
Add-DnsServerResourceRecordA -Name equipier -ZoneName asrc.local -IPv4Address 192.168.8.1
Add-DnsServerPrimaryZone -NetworkID 192.168/16 -ZoneFile "168.192.in-addr.arpa.dns"
Add-DnsServerForwarder -IPAddress 8.8.8.8 -PassThru
Add-DnsServerConditionalForwarderZone -Name "asrc.dev" -MasterServers 192.168.128.1 -PassThru
Add-DnsServerConditionalForwarderZone -Name "asrc2.local" -MasterServers 192.168.128.1 -PassThru
Add-DnsServerZoneDelegation -Name "asrc.local" -ChildZoneName "devs" -NameServer "asrc.local" -IPAddress 192.168.128.1 -PassThru -Verbose
Set-DnsServerPrimaryZone  -Name asrc.local -SecureSecondaries TransferToSecureServers -SecondaryServers 192.168.128.1
Set-DnsServerPrimaryZone  -Name 168.192.in-addr.arpa -SecureSecondaries TransferToSecureServers -SecondaryServers 192.168.128.1

# Reboot on laisse un -Confirm au dÃ©but, histoire d'analyser d'Ã©ventuelles erreurs,
# une fois que l'on est sÃ»r de son coup, on peut le passer en commentaire

Restart-Computer 
