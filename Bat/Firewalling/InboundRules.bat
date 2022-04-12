REM documentation a checker https://docs.microsoft.com/fr-fr/troubleshoot/windows-server/networking/netsh-advfirewall-firewall-control-firewall-behavior
rem ancienen commande netsh pour le firewalling 
netsh advfirewall firewall add rule name= "Open Port 80" dir=in action=allow protocol=TCP localport=80

REM nouvele comamdne selon mcirosoft 
netsh advfirewall firewall add rule name= "Open Port 80" dir=in action=allow protocol=TCP localport=80



REM ancienne commadne de suppression une regle de firewall 
delete portopening protocol=UDP port=500	

REM  nouvelel commande de supressino d'une regle de firewall sosu windws 
netsh advfirewall firewall delete rule name= rule name protocol=udp localport=500

REM Aciver certaisn services sepecifiques 
REM Ancienne commande pour activer les servicesspecifiques 
netsh firewall set service FileAndPrint	
REM nouvelle commande pour acotver le partage des imprimante 
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes

REM ancienne commande poru l'Activatino de regle sur tous profiles 
netsh firewall set service RemoteDesktop enable profile=ALL	
REM nouvelle commande ACTIVECTION DE REGEL POUR un profile en particulier et voir si cela est possible pour d'autre
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes profile=domain




REM restaurer les valerus 
