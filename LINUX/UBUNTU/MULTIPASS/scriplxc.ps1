#Permet juste de creer un serveur se nomant primary
multipass shell 
#Suppression de la machine se nommant primary 
multipass delete -p primary
#Liste toutes les machines virtuelles gerer par mulitpass 
multipass list 

#Permet de lancer une vm pouvant aller jusqu"a 100GO
#ATTENTION , si vous mettez en place se script sur une vm imrpibiqué . 
#8 go sur une vm peu s'averrer inssufissant et provoque une rrreur 
multipass launch -c 2 -d 100G -m 8G -n lxdh1

#Accès directe a la machien virtuelle lxdh1
multipass shell lxdh1

#Mise à jour de la machine virtuelle 
sudo apt update -y 

#Installation du paquet 
sudo apt-get install lxc

#Se mettre en utilisateur root 
su - 

#Initilaisation de la machine qui gere lxc 
lxd init
#Would you like to use LXD clustering? (yes/no) [default=no]:
#Do you want to configure a new storage pool? (yes/no) [default=yes]: yes
#Name of the new storage pool [default=default]:
#Name of the storage backend to use (dir, lvm, zfs, ceph, btrfs) [default=zfs]:
#Create a new ZFS pool? (yes/no) [default=yes]:
#Would you like to use an existing empty block device (e.g. a disk or partition)? (yes/no) [default=no]:
#Size in GB of the new loop device (1GB minimum) [default=19GB]:
#Would you like to connect to a MAAS server? (yes/no) [default=no]:
#Would you like to create a new local network bridge? (yes/no) [default=yes]:
#What should the new bridge be called? [default=lxdbr0]:
#What IPv4 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]: 10.10.10.1/24
#Would you like LXD to NAT IPv4 traffic on your bridge? [default=yes]:
#What IPv6 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]: none
#Would you like the LXD server to be available over the network? (yes/no) [default=no]:
#Would you like stale cached images to be updated automatically? (yes/no) [default=yes]
#Would you like a YAML "lxd init" preseed to be printed? (yes/no) [default=no]:

#Affiche toutes les images lxc disponible
lxc list 
#Pemret d'afficher toutes les images ubuntu disponible sur mulitpass
lxc image list images:ubuntu/focal/cloud

#lxc delete -f <nom du conteneur>
#Recherche d'image mulitpass amazonlinux
lxc image list images:amazon | grep CONT | grep x86

#Copie de fichier de l'image amazon renommé en amzl (amazon linux)
lxc image copy images:amazonlinux local: --alias amzl

#Lister toutes les images multipass disponible EN  local sur mon psote 
lxc image list 
#Creation d'un conteneur se nommant webserver utilisant l'image amazonlinux 
lxc init amzl webserver
#Creation d'un conteneur se nommant bdd utilisant l'image amazonlinux 
lxc init amzl bdd
#demarrage du conteneur se nommant webserveur l'image amazonlinux 
lxc start webserver 
#demarrage du conteneur se nommant bdd utilisant l'image amazonlinux
lxc start amzl lauch bdd 
#Accès à l'instance 
lxc shell webserver 
#Accès à l'instance bdd 
lxc shell amzl lauch bdd 

#demarrage du conteneur se nommant webserveur l'image amazonlinux 
lxc stop webserver 
#demarrage du conteneur se nommant bdd utilisant l'image amazonlinux
lxc stop bdd 

#lxc delete -f <nom du conteneur>
