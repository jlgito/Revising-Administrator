#!/bin/bash

#Demarrage manuelle du service iptables
systemctl start iptables

#Permet à iptable de s'activer aui demarrage 
systemctl enable iptables

 #Stoppper iptable manuellement
systemctl stop iptables

#Redemarrer iptables manuellement
systemctl restart iptables

#Empecher iptable de s'activer au demarrage
systemctl disable iptables



#Chack existing firewalls rules 
iptables -L -n -v


#Block specific ip address ip table address 
iptables -A INPUT -s xxx.xxx.xxx.xxx -j DROP

#Ou bien pour bloquer le traffic provenant d'un certaien ip
iptables -A INPUT -p tcp -s xxx.xxx.xxx.xxx -j DROP


#Bloquerle port tcp spcfique 
iptables -A OUTPUT -p tcp --dport xxx -j DROP


#Accepter le port specifque
iptables -A INPUT -p tcp --dport xxx -j ACCEPT


 #Voir les regle sde nat pour le firewall 
 iptables -t nat -L -v -n
 
 
 #Permettre l'accès de plusieurs ports via des règels multiports 
iptables -A INPUT  -p tcp -m multiport --dports 22,80,443 -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --sports 22,80,443 -j ACCEPT



#Setup un port forwarding 
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 25 -j REDIRECT --to-port 2525


#Voir se lien ci pour plus de manipualtion sur iptables .
