## KUBERNATES INSTALLATION ON AWS DURING EC2 INSTANCE LAUNCH

**This Script to be added inside "User data" field under "Advanced details" section during the AWS EC2 Instance Launch.**

```
#!/bin/bash
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
wget "https://download.docker.com/linux/static/stable/x86_64/docker-20.10.0.tgz"
tar -xzf docker-20.10.0.tgz
cp docker/* /usr/bin/
yum install iptables -y -q
dockerd & > /dev/null 2>&1

#INSTALLATION OF DOCKER-COMPOSE
cd /home/ec2-user
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#INSTALLATION OF MINIKUBE
cd /home/ec2-user
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
install minikube-linux-amd64 /usr/local/bin/minikube
chown -R ec2-user:ec2-user /home/ec2-user/*

chmod 777 /var/run/docker.sock
```

**TO START MINIKUBE**
```
minikube start --driver=docker
```
This has be executed manually to start minikube.
