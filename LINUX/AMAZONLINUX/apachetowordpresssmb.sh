#!/usr/bin/sh
#######################################################################################
########################Partie 1 : FOICHIER WORDPRESS UNIQUEMENT#######################
#######################################################################################
sudo yum update -y
sudo yum install -y wget tar
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd
sudo systemctl enable --now httpd
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
yum install samba-client -y
#######################################################################################
########################Partie 2 : Fichir de configuration smbclient#######################
#######################################################################################
mkdir -p /mnt/linuxshare
#######################################################################################
########################Partie 2 : Fichir de configuration smbclient#######################
#######################################################################################
mkdir -p /etc/credential
cd /etc/credential
sudo echo -e "username=smbuser\npassword=IRDnop9311" >> /etc/credential
sudo mount -t cifs -o credentials=/etc/credential //10.0.2.98/partage /mnt/linuxshare


#######################################################################################
########################Partie 2 : Modification d'APACHE         #######################
#######################################################################################
sed -i 
sed -i 
