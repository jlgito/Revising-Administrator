#Pour permettre à une connexion déjà ouverte de recevoir du trafic :
iptables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

#Permetttrre le traffic sssh entrant sur ma machine 
iptables -A INPUT -p tcp -i eth0 --dport ssh -j ACCEPT


#Maintenant vous pouvez vérifier vos règles iptable
iptables -L
#Accepter le traffic sur le port 80
 iptables -A INPUT -p tcp -i eth0 --dport 80 -j ACCEPT
 #Maintenant vous pouvez vérifier vos règles iptable
 iptables -L

#Maintenant que nous avons fini avec les autorisations, il faut maintenant bloquer le reste. 
#Nous allons en fait modifier la « politique par défaut » (policy) de la chaîne INPUT : cette décision (DROP) 
#s'applique lorsque aucune règle n'a été appliquée à un paquet.
#Donc, si la tentative de connexion n'est permise par aucune des règles précédentes, elle sera rejetée.
iptables -P INPUT DROP #warning : a ne pas utiliser sur un serveur distant !
iptables -L

#Un p'tit problème de notre configuration est que même l'interface locale (loopback) est bloquée. Nous pourrions avoir écrit les règles de rejet seulement
#pour eth0 en spécifiant -i eth0, mais nous pouvons aussi ajouter une règle pour loopback. Par exemple, nous pourrions l'insérer en 2e position :
iptables -I INPUT 2 -i lo -j ACCEPT

#Lister des regles en details 
iptables -L -v -n


# On autorise le PC a faire des pings sur des IP externes et à répondre aux requêtes "ping"
iptables -A OUTPUT -p icmp -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT

# Si vous utilisez une ancienne version de iptables la commande ci-dessus peut ne pas fonctionner, dans ce cas entrez la commande suivante :
iptables -A OUTPUT -p icmp -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT

# On autorise les pings 
iptables -A INPUT -p icmp -j ACCEPT


#Apppliqueer les changements des règles 
service iptables-persistent


#Suppression de la deuxile migne 
iptables -D OUTPUT 2



#https://doc.ubuntu-fr.org/iptables
