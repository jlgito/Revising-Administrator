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
mkdir -p /etc/linux-credential
cd /etc/linux-credential
echo -e "username=user\npassword=password" >> credential
sudo mount -t cifs -o credentials=/etc/linux-credential //WIN_SHARE_IP/<share_name> mkdir -p /mnt/linuxshare
/etc/fstab
#######################################################################################
########################Partie 2 : Modification d'APACHE         #######################
#######################################################################################
sed -i 
sed -i 
