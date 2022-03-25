#https://doc.ubuntu-fr.org/tutoriel/creer_un_miroir_de_depot

#Installer le paquet mirroir
sudo apt install apt-mirror

#Une fois la partition créée monter votre disque, et donnez-lui les droits comme suit:
sudo chown $USER /media/$USER/Depots

#Créez un dossier miroir sur le disque Depots, avec cette commande par exemple:
mkdir /media/$USER/Depots/miroir

#Dans celui-ci, nous avons besoin de créer 3 sous-dossiers afin que apt-mirror puisse fonctionner :
mkdir -p /media/$USER/Depots/miroir/{mirror,skel,var}

#spécifier à apt-mirror d'utiliser votre propre fichier de configuration comme ceci :
sudo apt-mirror /media/$USER/Depots/miroir/apt-mirror-configuration

#Tout d'abord copiez le fichier original dans votre répertoire :
sudo cp /etc/apt/mirror.list /media/$USER/Depots/miroir/apt-mirror-configuration


#Éditez le fichier « /media/$USER/Depots/miroir/apt-mirror-configuration » (votre fichier de configuration) afin que celui-ci contienne :



############# config ##################
#
set base_path /media/$USER/Depots/miroir
## Dans le cas d'un serveur web gardez le chemin par défaut (celui qui suit) ##
#set base_path    /var/spool/apt-mirror
# if you change the base path you must create the directories below with write privileges
#
set mirror_path  $base_path/mirror
set skel_path    $base_path/skel
set var_path     $base_path/var
set cleanscript $var_path/clean.sh
## set defaultarch xxxx (votre architecture i386/hppa/powerPC/ia64...)
set defaultarch  i386
set postmirror_script $base_path/postmirror.sh
set run_postmirror 0
set nthreads     10
set _tilde 0
#
############# end config ##############

######################################################
##        UBUNTU VERSION Bionic Beaver - 18.04      ##
##                i386 - 32bits                     ##
######################################################

##  Dépôts officiels  ##
deb http://fr.archive.ubuntu.com/ubuntu bionic main restricted
deb http://security.ubuntu.com/ubuntu bionic-security main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb http://fr.archive.ubuntu.com/ubuntu bionic-updates main restricted

##  Dépôts Universe et Multiverse  ##
deb http://fr.archive.ubuntu.com/ubuntu/ bionic universe
deb http://fr.archive.ubuntu.com/ubuntu/ bionic-updates universe
deb http://security.ubuntu.com/ubuntu bionic-security universe
deb http://fr.archive.ubuntu.com/ubuntu/ bionic multiverse
deb http://fr.archive.ubuntu.com/ubuntu/ bionic-updates multiverse
deb http://security.ubuntu.com/ubuntu bionic-security multiverse

##  Dépôts Backports  ##
deb http://fr.archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse

## Dépôt commercial  ##
deb http://archive.canonical.com/ubuntu bionic partner

## Uncomment the following two lines to add software from Ubuntu's 'extras' repository.##
deb http://extras.ubuntu.com/ubuntu bionic main

####################################################
##     UBUNTU VERSION bionic Beaver - 18.04       ##
##                AMD-64 - 64bits                 ##
####################################################

##  Dépôts officiels  ##
deb-amd64 http://fr.archive.ubuntu.com/ubuntu/ bionic main restricted
deb-amd64 http://security.ubuntu.com/ubuntu bionic-security main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb-amd64 http://fr.archive.ubuntu.com/ubuntu/ bionic-updates main restricted

##  Dépôts Universe et Multiverse  ##
deb-amd64 http://fr.archive.ubuntu.com/ubuntu/ bionic universe
deb-amd64 http://security.ubuntu.com/ubuntu bionic-security universe
deb-amd64 http://fr.archive.ubuntu.com/ubuntu/ bionic-updates universe
deb-amd64 http://fr.archive.ubuntu.com/ubuntu/ bionic multiverse
deb-amd64 http://security.ubuntu.com/ubuntu bionic-security multiverse
deb-amd64 http://fr.archive.ubuntu.com/ubuntu/ bionic-updates multiverse

##  Dépôts Backports  ##
deb-amd64 http://fr.archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse

## Dépôt commercial  ##
deb-amd64 http://archive.canonical.com/ubuntu bionic partner

## Uncomment the following two lines to add software from Ubuntu's 'extras' repository.##
deb-amd64 http://extras.ubuntu.com/ubuntu bionic main

####################################################
##     UBUNTU VERSION Bionic Beaver - 18.04       ##
##               Sources                          ##
####################################################

#deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic main restricted
#deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic-updates main restricted
#deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic universe
#deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic-updates universe
#deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic multiverse
#deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic-updates multiverse
#deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse
#deb-src http://security.ubuntu.com/ubuntu bionic-security main restricted
#deb-src http://security.ubuntu.com/ubuntu bionic-security universe
#deb-src http://archive.canonical.com/ubuntu bionic partner
#deb-src http://extras.ubuntu.com/ubuntu bionic main


############# clean ##############

clean http://fr.archive.ubuntu.com/ubuntu/ bionic
clean http://security.ubuntu.com/ubuntu bionic-security
clean http://archive.canonical.com/ubuntu bionic
clean http://extras.ubuntu.com/ubuntu bionic

#Les lignes dont vous devez vous soucier sont :
set base_path /media/$USER/Depots/miroir

#Elle est à adapter à votre cas. Si vous utilisez un serveur apache, gardez le chemin par défaut:
set base_path    /var/spool/apt-mirror

#Cette ligne :
set defaultarch i386

#Lancez la création de votre miroir par :
sudo apt-mirror /media/$USER/Depots/miroir/apt-mirror-configuration

#Rappellez-vous que si vous ne passez pas de fichier de configuration à la commande apt-mirror, c'est celui par défaut qui sera utilisé (« /etc/apt/mirror.list »), comme pour un serveur web avec apache, la commande est alors celle-ci:
su - apt-mirror -c apt-mirror
#Voir la secittion ' del a documentation pour savoir se qui c'est passé

#Vous pouvez également ajouter:
 set limit_rate 500k
 
 #Veuillez vérifier les lignes suivantes dans le fichier wgetrc:
 vi /etc/wgetrc
   http_proxy ==/pre>
   
#Faites une sauvegarde de ce fichier :
sudo cp /etc/apt/sources.list /etc/apt/sources.list.ORIGINAL


#Ouvrez le fichier « /etc/apt/sources.list ».
#Supprimez-en tout le contenu,
#Ajoutez (en remplaçant $USER par votre nom d'utilisateur) :
deb file:/media/$USER/Depots/miroir/mirror/archive.ubuntu.com/ubuntu/ bionic main restricted multiverse universe
deb file:/media/$USER/Depots/miroir/mirror/archive.ubuntu.com/ubuntu/ bionic-updates main restricted multiverse universe
deb file:/media/$USER/Depots/miroir/mirror/archive.ubuntu.com/ubuntu/ bionic-security main restricted multiverse universe
deb file:/media/$USER/Depots/miroir/mirror/archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse


#Sauvegardez votre fichier.
#Mettez à jour votre système de gestion de paquet :
sudo apt-get update

#Coté serveur
#Un petit serveur HTTP vous suffit pour ce que vous avez à faire, inutile d'installer et configurer une artillerie lourde comme Apache2. Python est notre ami ! Cependant si vous souhaitez tout de même utiliser apache regardez ci-dessous.
#Ouvrez une terminal, placez-vous dans le dossier qui sera la racine de votre serveur:
cd /media/$USER/Depots/miroir/


#Entrez la commande magique :
 python -m SimpleHTTPServer 80 &
 
 
#Sous Focal Fossa (20.04) la commande est :
python3 -m http.server 80 &


#Côté client
#sauvegardez le fichier de configuration:
sudo cp /etc/apt/sources.list /etc/apt/sources.list.ORIGINAL

#Là où vous avez une ligne du style:
deb http://fr.archive.ubuntu.com/ubuntu/ bionic-updates main restricted multiverse universe


#vous allez devoir remplacer l'adresse internet du serveur original par celui que vous avez spécialement installé. Si mon serveur est sur l'adresse 192.168.0.1 je modifie ma ligne et j'obtiens :
deb http://192.168.0.1/mirror/fr.archive.ubuntu.com/ubuntu/ bionic-updates main restricted multiverse universe

#On fait prendre en compte le nouveau fichier de configuration par un :
sudo apt-get update

#Commencez par installer le paquet apache2. Puis créez un lien symbolique pour que le dépôt soit accessible via le serveur web :
ln -s /var/spool/apt-mirror/mirror/ /var/www/ubuntu


#Avant de partir il vous faut restaurer la configuration initiale du système de paquet. Il vous faut donc remettre en état le système.
#Sauvegardez votre fichier modifié :
sudo cp /etc/apt/sources.list /etc/apt/sources.list.MIROIR

#Remise en place du fichier original :
sudo rm /etc/apt/sources.list
sudo cp /etc/apt/sources.list.ORIGINAL /etc/apt/sources.list

#Prise en compte de celui-ci par le système :
sudo apt-get update


#Manuellement
#Il suffit pour cela de relancer apt-mirror avec votre fichier de configuration et votre disque dur externe en place (ou votre miroir accessible selon le chemin indiqué dans la configuration de apt-mirror) :
 apt-mirror /media/$USER/Depots/miroir/apt-mirror-configuration

#Tout est prêt. Il suffit juste de décommenter une ligne dans le fichier « /etc/cron.d/apt-mirror », pour cela on enlève le « # » de la ligne :
0 4	* * *	apt-mirror	/usr/bin/apt-mirror > /var/spool/apt-mirror/var/cron.log


#On ajoute le fichier de configuration si celui-ci n'est pas celui par défaut et on en profite pour modifier l'heure afin d'obtenir :
0 13	* * *	apt-mirror	/usr/bin/apt-mirror /media/$USER/Depots/miroir/apt-mirror-configuration > /var/spool/apt-mirror/var/cron.log

#Dans cet exemple, comme /usr/bin/apt-mirror est lancé en tant qu'utilisateur apt-mirror il faut que les répertoires du miroir soient modifiables par cet utilisateur :
sudo chown -R apt-mirror /media/$USER/Depots/miroir/{mirror,skel,var}


#L'erreur suivante s'affiche dans votre terminal:
apt-mirror is already running, exiting at /usr/bin/apt-mirror line 187.

#La solution est de supprimer le fichier apt-mirror.lock:
rm -f /media/$USER/Depots/mirror/var/apt-mirror.lock


#Créer un dossier temporaire pour accueillir nos fichiers avant modifications et déplacez-vous dedans, pour ce faire entrez dans un terminal les commandes:
mkdir mon_tmp 
cd mon_tmp

#Téléchargez les fichiers meta-release-lts et meta-release-lts-proposed dans le répertoire temporaire:
wget http://changelogs.ubuntu.com/meta-release-lts 
wget http://changelogs.ubuntu.com/meta-release-lts-proposed


#Récupérons tout d´abord le répertoire:
wget -r http://archive.ubuntu.com/ubuntu/dists/bionic/main/dist-upgrader-all/current


#Maintenant vous devez avoir :
ls

#Créer le dossier de description de la mise à jour (Dist-proposed/main/dist-upgrader-all) dans notre miroir:
mkdir -p  /media/$USER/Depots/miroir/mirror/archive.ubuntu.com/ubuntu/dists/bionic/main/dist-upgrader-all

#Copiez dans le dépôt le dossier dist-upgrader-all en remplaçant « Votre-Distrib » par la version Ubuntu cible ici bionic :
cp -r archive.ubuntu.com  /media/$USER/Depots/miroir/mirror/archive.ubuntu.com/ubuntu/dists/bionic/main/dist-upgrader-all/

#Créer dans le dépôt un nouveau dossier changelogs visible par le client:
mkdir /media/$USER/Depots/miroir/mirror/archive.ubuntu.com/ubuntu/dists/changelogs

#Copier les fichiers meta-release*:
cp -r meta-release* /media/$USER/Depots/miroir/mirror/archive.ubuntu.com/ubuntu/dists/changelogs/



#Éditez le fichier /etc/update-manager/meta-release:
# default location for the meta-release file
  [METARELEASE]
  URI =/meta-release
  URI_LTS =/meta-release-lts
  URI_UNSTABLE_POSTFIX = -development
  URI_PROPOSED_POSTFIX = -proposed

#Les lignes à modifier sont:
 URI =/meta-release 
  URI_LTS =/meta-release-lts

#Dans le cas de l'exemple remplacez ces deux lignes par :
  URI =/ubuntu/dists/changelogs/meta-release
  URI_LTS =/ubuntu/dists/changelogs/meta-release-lts






