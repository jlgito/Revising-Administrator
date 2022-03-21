#!/bin/bash

sudo ufw status
sudo ufw enable

#Pour un suivi de la journalisation de mon pare feu 
#Journalisation : on (low) 
#(Verifier ou ous seront jorunalser les ficheirs sur le 
#le poste je pense)

#Verficatino des numero de règles 
sudo ufw status numbered

#Activer la journalisation
#sudo ufw logging on

#Desactivation de la jorunalisation 
#sudo ufw logging off

#Ouverture de prot entrant 
sudo ufw allow 25/tcp

#Autoriser un port sortant
sudo ufw allow out 2628/tcp


#Autoriser un service 
sudo ufw allow smtp




#Insertion d'une regle par postionnnement 
sudo ufw insert 2 deny proto udp to any port 514 from 1.2.3.4

#Nep as autorier un ping 
# -A ufw-before-input -p icmp --icmp-type echo-request -j ACCEPT

#En cas d'erreur  **"ERROR: / is world writable
#sudo chown root:root /
#sudo chown root:root /

#Surcharge de l'espace disque merci de suivre ses indicatinos 

#sudo  ufw logging off
#sudo  ufw logging low

#Surppimer un port 
#sudo ufw delete [numéro]

#Suppresion d'une tegle de pare feu sortante 
sudo ufw deny out [règle]
