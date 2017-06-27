# Install Docker

docker -v
if [ $? -ne 0 ]; then
    echo 'Docker' is currently not installed.
    sudo wget --progress=bar:force:noscroll -qO- https://get.docker.com/ | sed 's/lxc-docker/lxc-docker-17.04.0-ce/' | sh
    
    echo ==============================
    echo Installed docker successfully
    echo ==============================
else
    echo ==============================
    echo  Docker is already installed
    echo ==============================
fi

sudo systemctl start docker
sudo systemctl status docker
sudo systemctl enable docker

echo ==============================
echo =     Starting Docker...     =
echo ==============================

# Install Docker-Compose
sudo pip install docker-compose

echo ======================================
echo Installed docker-compose successfully
echo ======================================