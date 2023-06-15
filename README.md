# Project1-k8s-minikube-kubectl
# javascript website docker image deployment on K8s minikube cluster

# Two EC2 instances are required to perform CI & CD

# PRE-REQUISITES:
# server-1
# docker installation required. Execute following commands on server-1
# For Docker Installation
sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod -aG docker $USER && newgrp docker



# PRE-REQUISITES:
# server-2
# minikube & cubectl

# For Minikube & Kubectl
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube 

sudo snap install kubectl --classic
minikube start --driver=docker

