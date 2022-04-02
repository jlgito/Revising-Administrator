#!/usr/bin/sh
#######################################################################################
########################Partie 1 : FOICHIER WORDPRESS UNIQUEMENT#######################
#######################################################################################
sudo curl -O https://wordpress.org/latest.tar.gz
sudo tar zxvf latest.tar.gz -C /var/www/html
sudo cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sudo sed -i 's/database_name_here/wordpress/' /var/www/html/wordpress/wp-config.php
sudo sed -i 's/username_here/wp_user/' /var/www/html/wordpress/wp-config.php
sudo sed -i 's/password_here/paSSw0rdSecured/' /var/www/html/wordpress/wp-config.php
sudo sed -i 's/localhost/db1/' /var/www/html/wordpress/wp-config.php
rm latest.tar.gz 
sudo chown -R apache /var/www
sudo chgrp -R apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
sudo systemctl restart httpd
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
