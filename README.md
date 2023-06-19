# Project1-k8s-minikube-kubectl
# javascript website docker image deployment on K8s minikube cluster

# Two EC2 instances are required to perform CI & CD


# SERVER-1
# PRE-REQUISITES:
# docker installation required. Execute following commands on server-1
# For Docker Installation
sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod -aG docker $USER && newgrp docker

# Dockerfile - file carries nginx command to copy the local files to nginx web server

# buid docker image
docker build -t sama863nz/sam-website:v1 .
docker run -d -p 8000:8000 sama863nz/sam-website:v1
# test it on the browser by
localhost:80 
OR 
publicIP-EC2:80

# push docker image to dockerhub
docker push sama863nz/sam-website:v1

# the image cab be accessed on dockerhub as
https://hub.docker.com/r/sama863nz/sam-website/tags



# SERVER-2
# PRE-REQUISITES:
# minikube & cubectl

# For Minikube & Kubectl
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube 

sudo snap install kubectl --classic
minikube start --driver=docker

