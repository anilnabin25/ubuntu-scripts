set -e

echo "== started installing docker =="
echo "for removing the old docker"
apt-get remove docker docker-engine docker.io containerd runc
echo "for updating the for docker installation"
apt-get update
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "for installation of the docker"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

echo "for using docker without sudo"
groupadd docker
usermod -aG docker $USER
chown "$USER":"$USER" /home/"$USER"/.docker -R
chmod g+rwx "$HOME/.docker" -R
chmod 666 /var/run/docker.sock
docker --version
echo "== end installing docker =="


echo "== start installing composer =="
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version
echo "== end installing composer =="
