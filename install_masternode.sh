#!/bin/bash
BLOCKS_NAME="piratecash-blocks-22.07.2024.tar.bz2"
BLOCKS_URL="https://github.com/piratecash/piratecash/releases/download/v18.2.2/$BLOCKS_NAME"

original_dir=$(pwd)

ufw disable

###### FIREWALL
#
# Replace 11.22.33.44 with your external IP if you have a static IP and uncomment:
#iptables -A INPUT -s 11.22.33.4/32 -j ACCEPT
#iptables -A INPUT -p tcp -m tcp --dport 22 -j DROP

ip6tables -A INPUT -p tcp -m tcp --dport 22 -j DROP
ip6tables -A INPUT -p tcp -m tcp --dport 10050 -j DROP

apt -y install iptables-persistent mc

###### INSTALL DOCKER
#
#
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
apt-get -y install docker-compose

###### CONFIGURE NODE
#
#
mkdir -p /opt/node/piratecash
cp -f piratecash-main/piratecash.conf /opt/node/piratecash/

# SET UP HOST IP
ip_address=$(hostname -I | awk '{print $1}')
sed -i "s/^#externalip=.*/externalip=$ip_address/" /opt/node/piratecash/piratecash.conf

# Generate a random username and password
USERNAME=$(openssl rand -base64 12 | tr -d '/+=' | cut -c1-12)
PASSWORD=$(openssl rand -base64 12 | tr -d '/+=' | cut -c1-16)

# Update the configuration file with the new username and password
sed -i "s/^#rpcuser=.*/rpcuser=$USERNAME/" /opt/node/piratecash/piratecash.conf
sed -i "s/^#rpcpassword=.*/rpcpassword=$PASSWORD/" /opt/node/piratecash/piratecash.conf

###### DOWNLOADING BLOCKS
#
#
cd /opt/node/piratecash
wget $BLOCKS_URL
bzip2 -dc $BLOCKS_NAME | tar -x
rm -f $BLOCKS_NAME

chown -R 1001:1001 /opt/node/

###### DEPLOY
#
#
cd $original_dir
docker compose up --build -d
