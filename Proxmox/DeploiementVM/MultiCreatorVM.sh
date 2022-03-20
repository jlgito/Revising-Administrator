#!/bin/bash

echo " ______   ________  __       __  __    __
|  $$$$$$\| $$$$$$$$| $$\   /  $$| $$  | $$
| $$  | $$| $$__    | $$$\ /  $$$| $$  | $$
| $$  | $$| $$  \   | $$$$\  $$$$| $$  | $$
| $$ _| $$| $$$$$   | $$\$$ $$ $$| $$  | $$
| $$/ \ $$| $$_____ | $$ \$$$| $$| $$__/ $$
 \$$ $$ $$| $$     \| $$  \$ | $$ \$$    $$
  \$$$$$$\ \$$$$$$$$ \$$      \$$  \$$$$$$"
random="salut"
declare -i compteur=0
echo 'Need number of virtual machine please for automation PROXMOX or qemu'
read nbrvm
while (( compteur<nbrvm ))
do
echo 'Need Name of this vm '
read namevm
echo 'Need username for this user'
read username
echo 'Need password for this user'
read password
echo 'Need networkconfiguration as your ip/cidr)(other example : 10.0.3.2/24)'
read ipconfiguration
echo 'Need networkconfiguration as your ip/cidr)(other example : 10.0.3.2/24)'
read ipconfigurationgatewayx
echo "Votre machine"" "$random$compteur" ""cloné aura besoin de identifiant composé de 3 à 4 chiffre uniquement"
read id
echo "Le compteur c'est incremnté de" $random$compteur

compteur=compteur+1
#qm clone 9000 $id --name $namevm
#qm set $id --ciuser $username --cipassword $password --ipconfig0 ip=$ipconfiguration,gw=$ipconfigurationgateway
done
#for variable in mylist
#qm clone 9000 $id --name $variable
#qm set $id --ciuser zeri --cipassword iiii --ipconfig0 ip=10.0.3.2/24,gw=10.0.3.2
clear
#Etape de verificatino et affichage d'erreur possible ou non des vm
echo "Votre creation de machine virtuelle commence"
echo -ne '#####                     (33%)\r'
clear

#Etpae de verification et affichage d'erreur possubke ou non des disques
echo "Votre creation de machine virtuelle est toujours en cours"
echo -ne '#############             (66%)\r'
sleep 20
#Etpae de verification et affichage d'erreurpossible de la machine virtuelle
clear
echo 'Felicitation , vos machines virtuelles '
echo 'Vous avez 5 erreurs reperé'
echo "Les 5 ficheirs sont bien conformes"
echo "Votre creation de machine virtuelle est bien fini"
echo -ne '####################################################  (100%)\r'
echo -ne '\n'
