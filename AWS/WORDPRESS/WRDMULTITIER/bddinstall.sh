#!/usr/bin/sh
sudo yum update -y
sudo yum install -y mariadb-server
sudo systemctl enable --now mariadb
sudo mysql -e "CREATE DATABASE wordpress;"
sudo mysql -e "CREATE USER 'wp_user'@'%' IDENTIFIED BY 'paSSw0rdSecured';"
sudo mysql -e "GRANT ALL ON wordpress.* TO 'wp_user'@'%';"
sudo mysql -e "FLUSH PRIVILEGES;"
