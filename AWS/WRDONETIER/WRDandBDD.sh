#!/usr/bin/sh
sudo yum update -y
sudo yum install -y wget tar
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd
sudo systemctl enable --now httpd
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
sudo curl -O https://wordpress.org/latest.tar.gz
sudo tar zxvf latest.tar.gz -C /var/www/html
sudo cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sudo sed -i 's/database_name_here/wordpress/' /var/www/html/wordpress/wp-config.php
sudo sed -i 's/username_here/wp_user/' /var/www/html/wordpress/wp-config.php
sudo sed -i 's/password_here/paSSw0rdSecured/' /var/www/html/wordpress/wp-config.php
sudo sed -i 's/localhost/db1/' /var/www/html/wordpress/wp-config.php
rm latest.tar.gz 
sudo yum install -y php-gd
sudo chown -R apache /var/www
sudo chgrp -R apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
sudo systemctl restart httpd
sudo yum update -y
sudo yum install -y mariadb-server
sudo systemctl enable --now mariadb
sudo mysql -e "CREATE DATABASE wordpress;"
sudo mysql -e "CREATE USER 'wp_user'@'%' IDENTIFIED BY 'paSSw0rdSecured';"
sudo mysql -e "GRANT ALL ON wordpress.* TO 'wp_user'@'%';"
sudo mysql -e "FLUSH PRIVILEGES;"
