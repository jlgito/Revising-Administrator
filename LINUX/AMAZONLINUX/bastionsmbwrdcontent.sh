#!/usr/bin/sh
#######################################################################################
########################Partie 1 : FOICHIER WORDPRESS UNIQUEMENT#######################
#######################################################################################
mkdir -p /mnt/efs/fs1/var/www/html/wordpress/
mv /mnt/efs/fs1/var/www/html/wordpress/
sudo curl -O https://wordpress.org/latest.tar.gz
sudo tar zxvf latest.tar.gz -C /mnt/efs/fs1/var/www/html
sudo cp /mnt/efs/fs1/var/www/html/wordpress/wp-config-sample.php /mnt/efs/fs1/var/www/html/wordpress/wp-config.php
sudo sed -i 's/database_name_here/wordpress/' /mnt/efs/fs1/var/www/html/wordpress/wp-config.php
sudo sed -i 's/username_here/main/' /mnt/efs/fs1/var/www/html/wordpress/wp-config.php
sudo sed -i 's/password_here/lab-password/' /mnt/efs/fs1/var/www/html/wordpress/wp-config.php
sudo sed -i 's/localhost/db1/' /mnt/efs/fs1/var/www/html/wordpress/wp-config.php 
sudo chmod 2775 /mnt/efs/fs1/var/www && find /mnt/efs/fs1/var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
#########################################################################################
#################################PARTIE 2: deploiement smb################################
##########################################################################################
sudo yum update -y
sudo yum install samba samba-client -y
smbd --version
sudo systemctl start smbd
sudo systemctl enable smbd
nano /etc/samba/smb.conf
sudo adduser smbuser
sudo smbpasswd -a smbuser
sudo groupadd partage
sudo gpasswd -a smbuser partage
sudo chgrp -R partage /mnt/efs/fs1/var/www/html/wordpress/
sudo chmod -R g+rw /mnt/efs/fs1/var/www/html/wordpress/
sudo ls -l /mnt/efs/fs1/var/www/html/wordpress/