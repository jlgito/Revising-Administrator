#!/bin/bash

#Verifuer le status de mon pare feu 
sudo firewalld status

#Rendre actif le pare feu en permanence 
sudo apt install firewalld
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo firewall-cmd --state

#Moyen de changer zone à laide de cette commande ci je pense : 
#sudo firewall-cmd --set-default-zone=home

#Savoir laquelle de mes zone est celle par defautl
firewall-cmd --get-default-zonee

#Je prefere checker se qui c'est passer 
#sur chacun des profils du pare-feu.
sudo firewall-cmd --zone=dmz --list-all
sudo firewall-cmd --zone=home --list-all
sudo firewall-cmd --zone=public --list-all
sudo firewall-cmd --zone=trusted --list-all
sudo firewall-cmd --zone=internal --list-all
sudo firewall-cmd --zone=work --list-all
sudo firewall-cmd --zone=block --list-all
sudo firewall-cmd --zone=drop --list-all
sudo firewalld-cmd --zone=external --list-all

#Assignation d'interface à un profile en particulier 
sudo firewall-cmd --zone=home --change-interface=eth0
#sudo firewall-cmd --zone=home --change-interface=<another itnerface>

#Resultat verifiable avec la commande 
firewall-cmd --get-active-zones


#1er approche 
firewall-cmd --get-services

#Possilité de voir les differents services 
cat /usr/lib/firewalld/services


#Pour port forwarding voici les commandes trouvé sur internet 
#firewall-cmd --zone=external --add-forward-port=port=:proto=:toaddr=:toport= [--permanent]
#Un exempel : firewall-cmd --zone=external --add-forward-port=port=80:proto=tcp:toaddr=172.21.21.10:toport=80 --permanent




#Ajout d'un service temporairement le http
#sudo firewall-cmd --zone=public --add-service=http
#puis verifier avec la commande 
#sudo firewall-cmd --zone=public --list-services

#Ajouter en permanence un service comme ceci : 
sudo firewall-cmd --zone=public --add-service=http --permanent


#Ajotu de nouvelle regle dans mon pare feu 
sudo firewall-cmd --zone=public --permanent --add-port=5000/tcp
sudo firewall-cmd --zone=public --permanent --add-port=4990-4999/udp




#Enregistrement en permanence la configruation en place 
sudo firewall-cmd --zone=public --add-service=http --permanent


#Suppression de services 
#firewall-cmd --remove-service=http [--permanent]

