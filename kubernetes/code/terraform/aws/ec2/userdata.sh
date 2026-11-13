#!/bin/bash
yum update -y
yum upgrade -y
yum install iptables -y -q
dnf upgrade --releasever=2023.6.20250218 -y
timedatectl set-timezone Asia/Kolkata
#INSTALLATION OF KUBERNATES
cd /home/ec2-user
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
chown -R ec2-user:ec2-user /home/ec2-user/*
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
#INSTALLATION OF DOCKER
mkdir -pv /opt/docker
cd /opt/docker
wget "https://download.docker.com/linux/static/stable/x86_64/docker-27.5.1.tgz"
tar -xzf docker-27.5.1.tgz
cp docker/* /usr/bin/
groupadd docker
usermod -aG docker ec2-user
newgrp docker
dockerd > /dev/null 2>&1 &
#INSTALLATION OF DOCKER-COMPOSE
cd /home/ec2-user
curl -L "https://github.com/docker/compose/releases/download/v2.33.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
#INSTALLATION OF MINIKUBE
cd /home/ec2-user
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
install minikube-linux-amd64 /usr/local/bin/minikube
chown -R ec2-user:ec2-user /home/ec2-user/*
chmod 777 /var/run/docker.sock

#minikube start --driver=docker
#yum install iptables -y -q
#dockerd & > /dev/null 2>&1