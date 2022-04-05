yum install -y firewalld
systemctl enable firewalld
firewall-cmd --get-default-zone
 firewall-cmd --list-services
  firewall-cmd --list-services
  firewall-cmd --zone=public --add-service=http
  firewall-cmd --zone=work --list-services
   systemctl restart firewalld
   firewall-cmd --permanent --zone=public --add-service=http
   firewall-cmd --add-port=2222/tcp
   firewall-cmd --permanent --remove-port=444/tcp
   
   
   whitelisterrt une addresse ip specifique 
   firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="192.168.1.100" port protocol="tcp" port="3306" accept'

supprimer uen regle specifique 
firewall-cmd --permanent --remove-rich-rule='rule family="ipv4" source address="192.168.1.100" port protocol="tcp" port="3306" accept'
Confoiguration du pare feu sauvegardé 
firewall-cmd --reload


forwarport 
firewall-cmd --add-forward-port=port=port-number:proto=tcp|udp|sctp|dccp:toport=port-number
Suppriemr un forward de port
firewall-cmd --remove-forward-port=port=port-number:proto=<tcp|udp>:toport=port-number:toaddr=<IP>
Make the new settings persistent:
firewall-cmd --runtime-to-permanent


