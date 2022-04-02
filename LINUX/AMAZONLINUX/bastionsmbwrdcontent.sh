#!/usr/bin/sh
#######################################################################################
########################Partie 1 : FOICHIER WORDPRESS UNIQUEMENT#######################
#######################################################################################
mkdir -p /mnt/efs/fs1/var/www/html
sudo curl -O https://wordpress.org/latest.tar.gz
sudo tar zxvf latest.tar.gz -C /mnt/efs/fs1/var/www/html
sudo cp /var/www/html/wordpress/wp-config-sample.php /mnt/efs/fs1/var/www/html/wordpress/wp-config.php
sudo sed -i 's/database_name_here/wordpress/' /mnt/efs/fs1/var/www/html/wordpress/wp-config.php
sudo sed -i 's/username_here/main/' /mnt/efs/fs1/var/www/html/wordpress/wp-config.php
sudo sed -i 's/password_here/lab-password/' /mnt/efs/fs1/var/www/html/wordpress/wp-config.php
sudo sed -i 's/localhost/db1/' /mnt/efs/fs1/var/www/html/wordpress/wp-config.php 
sudo chmod 2775 /mnt/efs/fs1/var/www && find /mnt/efs/fs1/var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
#########################################################################################
#################################PARTIE 2: deploiement smb################################
##########################################################################################
yum update
sudo yum install samba samba-client
smbd --version
systemctl start smbd
systemctl enable smbd
nano /etc/samba/smb.conf
adduser it-connect
smbpasswd -a it-connect
groupadd partage
gpasswd -a it-connect partage
chgrp -R partage /srv/partage/
chmod -R g+rw /srv/partage/
ls -l /srv/
