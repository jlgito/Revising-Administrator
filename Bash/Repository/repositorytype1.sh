#!\bin\bash

 #Mise à jour de la distributino et des packets annexes
apt update && apt upgrade
#Installatino du packet apache2
apt install apache2

#Creation du repertoire avec les dossiers parents 
mkdir -p /var/www/html/ubuntu

#Accord des droits à l'utilsiateur par default d'apache 
chown www-data:www-data /var/www/html/ubuntu

#Mise à jour denouveau des paquets 
apt update 
#Installation du paquet apt-mirror
apt install apt-mirror

#Pour des raisons de securité ciopeir le fichier des repostry mirroir .
cp /etc/apt/mirror.list /etc/apt/mirror.list-bak

#Modification du fichir mirror.list
nano /etc/apt/mirror.list

############ config ##################
#
set base_path /var/www/html/ubuntu
#
# set mirror_path $base_path/mirror
# set skel_path $base_path/skel
# set var_path $base_path/var
# set cleanscript $var_path/clean.sh
# set defaultarch <running host architecture>
# set postmirror_script $var_path/postmirror.sh
# set run_postmirror 0
set nthreads 20
set _tilde 0
#
############# end config ##############

deb http://archive.ubuntu.com/ubuntu focal main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu focal-security main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu focal-updates main restricted universe multiverse
#deb http://archive.ubuntu.com/ubuntu artful-proposed main restricted universe multiverse
#deb http://archive.ubuntu.com/ubuntu artful-backports main restricted universe multiverse

# deb-src http://archive.ubuntu.com/ubuntu artful main restricted universe multiverse
# deb-src http://archive.ubuntu.com/ubuntu artful-security main restricted universe multiverse
# deb-src http://archive.ubuntu.com/ubuntu artful-updates main restricted universe multiverse
# deb-src http://archive.ubuntu.com/ubuntu artful-proposed main restricted universe multiverse
# deb-src http://archive.ubuntu.com/ubuntu artful-backports main restricted universe multiverse

clean http://archive.ubuntu.com/ubuntu

#Creation d'un dossier se nommant /ubuntu/var
mkdir -p /var/www/html/ubuntu/var 

#copie d'un fichierpermettant l'dexecutinon d'un postmirror sosu linux 
cp /var/spool/apt-mirror/var/postmirror.sh /var/www/html/ubuntu/var

#Mettre à jour le les mirroir present sur le poste 
apt-mirror


#Script à creer sans indentation de preference selon le site 
#le nom focal sera a changer avecc le nom de ma version normalement.
#!/bin/bash
for p in "${1:-focal}"{,-{security,updates}}\
/{main,restricted,universe,multiverse};do >&2 echo "${p}"
wget -q -c -r -np -R "index.html*"\ 
"http://archive.ubuntu.com/ubuntu/dists/${p}/cnf/Commands-amd64.xz" 
wget -q -c -r -np -R "index.html*"\
"http://archive.ubuntu.com/ubuntu/dists/${p}/cnf/Commands-i386.xz" 
done


#Permet l'executino du script cnf.sh
chmod +x cnf.sh 
#execution du script modifié précèdemment
bash cnf.sh


#Creation de dosser 
cp -av archive.ubuntu.com /var/www/html/ubuntu/mirror/


#Pour tester la disponibltié d'un repository local voici les comamndes le test qu'il faudra faire sur son navigateur 
http://ip-of-your-local-repository/ubuntu/mirror/archive.ubuntu.com/ubuntu/dists/focal/main/dep11/

#Rempalcmenet du fichier source.list précèdent
rm /etc/apt/sources.list
touch /etc/apt/sources.list

#Modification du nouveau fichier source.list
nano /etc/apt/sources.list


#deb [arch=amd64 trusted=yes] http://ip-of-your-local-repository-srv/ubuntu/mirror/archive.ubuntu.com/ubuntu focal main restricted 
#deb [arch=amd64 trusted=yes] http://ip-of-your-local-repository-srv/ubuntu/mirror/archive.ubuntu.com/ubuntu focal-updates main restricted 
#deb [arch=amd64 trusted=yes] http://ip-of-your-local-repository-srv/ubuntu/mirror/archive.ubuntu.com/ubuntu focal universe 
#deb [arch=amd64 trusted=yes] http://ip-of-your-local-repository-srv/ubuntu/mirror/archive.ubuntu.com/ubuntu focal-updates universe 
#deb [arch=amd64 trusted=yes] http://ip-of-your-local-repository-srv/ubuntu/mirror/archive.ubuntu.com/ubuntu focal multiverse 
#deb [arch=amd64 trusted=yes] http://ip-of-your-local-repository-srv/ubuntu/mirror/archive.ubuntu.com/ubuntu focal-updates multiverse 
#deb [arch=amd64 trusted=yes] http://ip-of-your-local-repository-srv/ubuntu/mirror/archive.ubuntu.com/ubuntu focal-security main restricted 
#deb [arch=amd64 trusted=yes] http://ip-of-your-local-repository-srv/ubuntu/mirror/archive.ubuntu.com/ubuntu focal-security universe 
#deb [arch=amd64 trusted=yes] http://ip-of-your-local-repository-srv/ubuntu/mirror/archive.ubuntu.com/ubuntu focal-security multiverse


#Il faudra terminer le teste avec la commande de mise à joru des repositorys 
apt-update







#https://www.it-connect.fr/ubuntu-comment-creer-son-propre-repository-local/
