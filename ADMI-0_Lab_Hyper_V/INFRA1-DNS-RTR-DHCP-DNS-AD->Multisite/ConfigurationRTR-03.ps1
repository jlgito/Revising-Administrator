Rename-Computer -NewName RTR-03


# Nommer Interfaces
Rename-NetAdapter -Name "Ethernet 2" -NewName "External" 
Sleep 10
Rename-NetAdapter -Name "Ethernet" -NewName "WAN"



# Configuration IP

netsh int ip set ad "WAN" static 192.168.255.254/24


# Activer Forwarding

netsh int ip set int "WAN" for=en
netsh int ip set int "External" for=en

# Ajout de route(s)
#route add -p 192.168.8.0/21 192.168.255.8
route add -p 192.168.12.0/21 192.168.255.8
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

netsh.exe routing ip nat install 
netsh.exe routing ip nat add interface name="WAN" mode=PRIVATE 
netsh.exe routing ip nat add interface name="External" mode=FULL 


# Reboot on laisse un -Confirm au dÃ©but, histoire d'analyser d'Ã©ventuelles erreurs,
# une fois que l'on est sÃ»r de son coup, on peut le passer en commentaire


Restart-Computer 
