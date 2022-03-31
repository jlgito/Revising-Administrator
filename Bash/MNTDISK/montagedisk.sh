#!\bin\bash
#Affichage des pojnts de montages 
lsblk
#Vericication du stockage ebs prcdemment creer 
ls-l /dev/sdg
#Creer un dossier de point de montage ci ncessaire 
sudo mkdir /mnt/data-store2
#Monter le volume dans un poitn de montage 
sudo mount /dev/sdg /mnt/data-store2/
#
df -hT
#Ecrire à l'aide de la comande cho directemlent dans le fiochier fstab
echo "/dev/sdf /mnt/datastore ext3 defaults noatime 1 2" | sudo tee -a /etc/fstab
#Creation d'un fichier de test pour voir si cela aura bien ecrit dans lme poitn de montage 
sudo sh -c "echo some text has been writeen > /mnt/data-store/file.txt
#Verificaiton de la presence du fichier dans le bon point dem ontage 
ls /mnt/data-store/
#Exemple de suppresion d'un pioutn de montage 
#sudo rm /mnt/data-store/
#ls /mnt/data-store 
#sudo mount /dev/sdg /mnt/data-store2/
#Affichage de la presence 
#sudo fdisk -l /dev/xvdg


Revoir le module 7 laboratoire ' poru de plus ample information egalementy.
