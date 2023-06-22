#!/bin/bash
# Instalar Docker
sudo yum update
sudo amazon-linux-extras install docker
sudo service docker start

#Agregar el usuario centos al grupo docker
sudo groupadd docker
sudo usermod -aG docker ec2-user