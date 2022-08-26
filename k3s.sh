#!/bin/bash
#SUMBER : https://blog.thenets.org/how-to-create-a-k3s-cluster-with-nginx-ingress-controller/

# Disable traefik
export INSTALL_K3S_EXEC="server --no-deploy traefik"

# Create k3s cluster
curl -sfL https://get.k3s.io | sh -s -

# admin credentials
# (probably the server is pointing to 127.0.0.1,
#  so you'll need to change to public/private
#  server ip)
#cat /etc/rancher/k3s/k3s.yaml

#How to add another k3s node?
#cat /var/lib/rancher/k3s/server/node-token

# Set variables
#export CONTROLLER_SERVER_IP="1.2.3.4"
#export K3S_TOKEN="CONTROLLER_TOKEN_HERE!!!"

# Add server as a worker node:
#curl -sfL https://get.k3s.io | K3S_URL=https://${CONTROLLER_SERVER_IP}:6443 sh

#INSTALL DOCKER :
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

sudo apt update
apt-cache policy docker-ce

sudo apt install docker-ce
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG
sudo usermod -aG docker username
