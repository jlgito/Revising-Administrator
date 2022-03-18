Rename-Computer -NewName RTR-01


# Nommer Interfaces bon
Rename-NetAdapter -Name "Ethernet 3" -NewName "ARC-CLI"
Sleep 10
Rename-NetAdapter -Name "Ethernet 2" -NewName "ARC-SRV"
Sleep 10
Rename-NetAdapter -Name "Ethernet" -NewName "WAN"
Sleep 10


# Configuration IP bon

netsh int ip set ad "Arc-SRV" static 192.168.8.254/24
netsh int ip set ad "ARC-CLI" static 192.168.12.254/24
netsh int ip set ad "WAN" static 192.168.255.8/24 
# Activer Forwarding
netsh int ip set int "ARC-SRV" for=en
netsh int ip set int "ARC-CLI" for=en
netsh int ip set int "WAN" for=en

# Ajout de route(s)
#route add -p 192.168.8.0/21 192.168.255.254
route add -p 192.168.128.0/24 192.168.255.128
route add -p 0.0.0.0/0 192.168.255.254


# Nommer Correctement Windows
# Le restart sera fait en fin de Configuration



# Config Pare-Feu

Get-NetFirewallRule -Name "*ICMP4-ERQ-In*" | Enable-NetFirewallRule 
Get-NetFirewallRule -Name "*ICMP4-ERQ-Out*" | Enable-NetFirewallRule 
# Installer RÃ´le Routing

Install-WindowsFeature -Name Routing -IncludeManagementTools

# Configurer RÃ´le Routing (Relais DHCP / NAT selon Ã©quipement)
# mise en route du role
Install-RemoteAccess -VpnType RoutingOnly

# Configuration agent relais

netsh.exe routing ip relay install
netsh.exe routing ip relay add dhcpserver 192.168.8.1
netsh.exe routing ip relay add interface "Arc-CLI"
netsh.exe routing ip relay set interface "Arc-CLI" min=0




netsh.exe routing ip relay add dhcpserver 192.168.8.1
netsh.exe routing ip relay add interface "Bou-LAN"
netsh.exe routing ip relay set interface "Bou-LAN" min=0

netsh.exe routing ip nat install 
netsh.exe routing ip nat add interface name="ARC-CLI" mode=PRIVATE 
netsh.exe routing ip nat add interface name="ARC-SRV" mode=PRIVATE 
netsh.exe routing ip nat add interface name="WAN" mode=PRIVATE 

Restart-Computer 






# Reboot on laisse un -Confirm au dÃ©but, histoire d'analyser d'Ã©ventuelles erreurs,
# une fois que l'on est sÃ»r de son coup, on peut le passer en commentaire
