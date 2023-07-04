# Project1-k8s-minikube-kubectl
# javascript website docker image deployment on K8s minikube cluster

# Two EC2 instances are required to perform CI & CD


# SERVER-1 (Ubuntu Linux t2-micro)
# PRE-REQUISITES:
# docker installation required. Execute following commands on server-1
# For Docker Installation
sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod -aG docker $USER && newgrp docker

# Dockerfile - file carries nginx command to copy the local files to nginx web server

# buid docker image
docker build -t sama863nz/sam-website:latest .

# docker run
docker run -d -p 80:80 sama863nz/sam-website:latest


# test the website deployed on the new EC2 Ubuntu instance on the browser by
http://54.197.201.14


# push docker image to dockerhub
docker push sama863nz/sam-website:latest

# the image cab be accessed on dockerhub as
https://hub.docker.com/repository/docker/sama863nz/sam-website/general



# SERVER-2 (Ubuntu Linux t2-medium)
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
# which will give http://192.168.49.2:31000

# test the deployed app (sam-website) on the minikube kubernetes cluster on the terminal
curl -L http://192.168.49.2:31000
minikube service --all

# to run the website on the browser, the minikube IP & port needs to be exposed
kubectl expose deployment sam-website-deployment --type=NodePort

# add port 80 in [Security Groups] - [inbound rules]
kubectl port-forward svc/sam-website-service 80:80 --address 0.0.0.0

# test the deployed app (sam-website) on the minikube kubernetes cluster on the browser
http://192.168.49.2:31000




