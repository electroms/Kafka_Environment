# Voir fichier de configuration docker-compose.yml en pièce jointe: 

yum install varnish
yum install ca-certificates

curl gnupg lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/centos/7/aarch64/stable/Packages/"

 yum update
 yum install docker-ce docker-ce-cli containerd.io
 yum install docker-compose

# Après avoir créer le fichier docker-compose.yml

ip link set down dev eth0
docker network create "your_network_name" --subnet"your_ip_docker"
ip link set up dev eth0
systemctl start docker

# et Exécuter la commande : 

docker-compose up -d
docker-compose ps
docker ps

# Afficher les logs : 

docker logs --follow kafka

# Afficher les logs, en mode non verbeux :

docker-compose logs kafka | grep -i started
docker ps
docker-compose ps

# Entrer dans la console Kafka :

docker exec -it "id_kafka" bash

# Aller dans le bon répertoire :

cd /usr/bin

# Créer un topic :

kafka-topics --create --bootstrap-server localhost:29092 --replication-factor 1 --partitions 1 --topic topic

# Ajouter des messages :

kafka-console-producer --broker-list localhost:29092 --topic topic1

# Récupérer les messages :
 
kafka-console-consumer --bootstrap-server localhost:29092 --topic topic1 --from-beginning

# Arreter docker-compose :

docker-compose down

# Supprimer les Data existantes après la modification du fichier docker-compose.yml:

rm -R kafka

# Relancer docker-compose :

docker-compose up -d


# Purger les images docker :

docker image prune -a

# Vérifier l'état des images :

docker-compose ps

# Entrer dans la console Kafka :

docker exec -it "id_kafka" bash

# Dans la console Kafka, Aller dans le bon répertoire :

cd /usr/bin

# Dans la console Kafka, Créer un topic :

kafka-topics --create --bootstrap-server localhost:29092 --replication-factor 1 --partitions 1 --topic topic

# Dans la console Kafka, Ajouter des messages :

kafka-console-producer --broker-list localhost:29092 --topic topic1

# Dans la console Kafka, Récupérer les messages :
 
kafka-console-consumer --bootstrap-server localhost:29092 --topic topic1 --from-beginning

# Dans la console Kafka, Afficher la liste des topic :

kafka-topics --list --bootstrap-server

# Dans la console Kafka, afficher les consumers : 

kafka-console-consumer --bootstrap-server localhost:29092 --topic topic1 --from-beginning

# Page web : 

localhost:9000 / localhost:5601
