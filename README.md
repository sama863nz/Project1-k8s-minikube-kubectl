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
docker build -t sama863nz/sam-website:latest .

# docker run is optional 
docker run -d -p 8000:8000 sama863nz/sam-website:latest
# test it on the browser by
localhost:8000 OR publicIP-EC2:8000

# push docker image to dockerhub
docker push sama863nz/sam-website:latest

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


# create a Deployment.yml file with neccesary commands
# run the Deployment.yml file by kubectl
kubectl apply -f Deployment.yml 

# create a Service.yml file with neccesary commands
# run the Service.yml file by kubectl
kubectl apply -f Service.yml

# lets access this website from outside of minikube
minikube service sam-website-service --url
# which will give http://192.168.49.2:32000

# test it on the terminal
curl -L http://192.168.49.2:32000

# to run the website on the browser, the minikube IP & port needs to be exposed
kubectl expose deployment sam-website-deployment --type=NodePort

# add port 3000 in [Security Groups] - [inbound rules]
kubectl port-forward svc/sam-website-service 3000:3000 --address 0.0.0.0

# test it on the browser
http://192.168.49.2:32000


