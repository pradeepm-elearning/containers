# DEVOPS
## CONTAINERS
### DOCKER & DOCKER-COMPOSE
#### DOCKER BINARY INSTALLATION ON LINUX

**1. DOWNLOAD THE DOCKER BINARY FILE FROM THE OFFICIAL DOCKER WEBSITE FROM [DOCKER BINARY DOWNLOAD LINK](`https://download.docker.com/linux/static/stable/`).**
```
sudo wget https://download.docker.com/linux/static/stable/x86_64/docker-<<VERSION>>.tgz
```

**2. INSTALL PRE-REQUISITES PACKAGES.**
```
sudo yum install iptables
sudo yum install git
```

**3. CREATE A SOFT LINK OF THE BINARIES TO THE `/usr/bin/` DIRECTORY.**
```
cd /<<PATH_OF_DOCKER_BINARY_FILE>>
sudo tar -xzvf docker-<<VERSION>>.tgz
sudo mv -v docker docker-<<VERSION>>
sudo chown -R root:root /<<PATH_OF_DOCKER_BINARY_FILE>>
sudo ln -s /<<PATH_OF_DOCKER_BINARY_FILE>>/docker-<<VERSION>>/* /usr/bin/
```

**4. CREATE USER & GROUP WHO CAN OWN THE DOCKER.**
```
sudo groupadd docker
sudo usermod -aG docker <<USER>>
```

**5. CREATE A SIMPLE SERVICE FILE FOR STARTING & STOPPING DOCKER.**
```
sudo vim /etc/systemd/system/docker.service
```
```
[Unit]
Description=Docker Service
After=network.target

[Service]
ExecStart=/usr/bin/dockerd
ExecReload=/bin/kill -s HUP \$MAINPID
Restart=on-failure
StartLimitBurst=3
StartLimitInterval=60s

[Install]
WantedBy=multi-user.target
```
```
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
```

**6. START-STOP & ENABLE DOCKER SERVICE DURING REBOOT.**
```
sudo systemctl start docker
sudo systemctl stop docker
sudo systemctl enable docker
```

**7. VERIFY DOCKER INSTALLATION.**
```
sudo docker version
sudo docker info
```

##### NOTE: By default, the Docker data is stored in the path `/var/lib/docker`

*** STORE DOCKER DATA ON A SPECIFIC/CUSTOMIZED PATH (OPTIONAL): ***

**8. STOP DOCKER SERVICE.**
```
sudo systemctl stop docker.service
```

**9. CREATE DATA DIRECTORY WHERE DOCKER IS INSTALLED.**
```
sudo mkdir -pv /<<PATH_OF_DOCKER_BINARY_FILE>>/docker-<<VERSION>>/data
```

**10. SYNC THE OLD DOCKER DATA DIRECTORY TO THE NEWLY CREATED DIRECTORY.**
```
sudo rsync -aqxP /var/lib/docker/ /<<PATH_OF_DOCKER_BINARY_FILE>>/docker-<<VERSION>>/data
```

**11. LIMIT THE DOCKER LOG FILE SIZE.**
```
sudo vim /etc/docker/daemon.json
```
```
{
  "data-root": "/<<PATH_OF_DOCKER_BINARY_FILE>>/docker-<<VERSION>>/data",
	"log-driver": "json-file",
  "log-format": "text",
  "log-level": "INFO",
  "log-opts": {
    "cache-disabled": "false",
    "cache-max-file": "5",
    "cache-max-size": "20m",
    "cache-compress": "true",
    "env": "os,customer",
    "labels": "somelabel",
    "max-file": "10",
    "max-size": "1024m"
  }
}
```

**12. RELOAD & START THE DOCKER SERVICE.**
```
sudo systemctl daemon-reload
sudo systemctl start docker.service
```

**13. REMOVE/RENAME THE OLD DOCKER DATA DIRECTORY.**
```
sudo rm -rf /var/lib/docker
```
*OR*
```
sudo mv -v /var/lib/docker /var/lib/docker.old
```

#### DOCKER COMPOSE INSTALLATION ON LINUX

**1. CREATE A DOCKER COMPOSE PLUGIN DIRECTORY ON THE SPECIFIC USER's HOME DIRECTORY
```
mkdir -p ~/.docker/cli-plugins
```

**2. REFER & DOWNLOAD THE DESIRED DOCKER COMPOSE RELEASE ON [DOCKER COMPOSE GITHUB LINK](https://github.com/docker/compose/releases).**
```
curl -SL "https://github.com/docker/compose/releases/download/<<DOCKER COMPOSE VERSION>>/docker-compose-linux-x86_64" -o ~/.docker/cli-plugins/docker-compose
```

**3. PROVIDE AN EXECUTABLE PERMISSION TO THE DOCKER COMPOSE FILE.**
```
chmod +x ~/.docker/cli-plugins/docker-compose
```

**4. VERIFY THE DOCKER COMPOSE VERSION.**
```
docker compose version
```
