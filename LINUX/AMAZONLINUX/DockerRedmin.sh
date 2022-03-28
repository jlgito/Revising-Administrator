!#/bin/bash
sudo yum update -y && yum update -y
sudo yum install docker -y
sudo systemctl start docker 
sudo systemctl enable docker 
sudo systemctl status docker 
sudo docker container run -d --name redmine1 -p 80:3000 redmine
ss -tlnp
docker ps 
#sudo docker contianer stop  redmine1
#Source du conteneur : https://hub.docker.com/_/redmine
