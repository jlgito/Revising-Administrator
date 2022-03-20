#Montage d'un cd d'installation
sudo mount -r ~/Downloads/ubuntu-20.04-live-server-amd64.iso /mnt

#Creation du fichier User-Data
cat > user-data << 'EOF'
#cloud-config
autoinstall:
  version: 1
  identity:
    hostname: ubuntu-server
    password: "$6$exDY1mhS4KUYCE/2$zmn9ToZwTKLhCw.b4/b.ZRTIZM30JZ4QrOQ2aOXJ8yk96xpcCof0kxKwuX1kqLG/ygbJ1f8wxED22bTL4F46P0"
    username: ubuntu
EOF
touch meta-data

#Installation du paquet 
sudo apt install cloud-image-utils

#Creation de l'image ISO
cloud-localds ~/seed.iso user-data meta-data
