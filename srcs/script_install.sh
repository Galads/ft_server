apt-get -y update
apt install -y ufw
ufw enable -y

apt-get -y install nginx
apt-get -y install wget
apt-get -y install curl
ufw app list
ufw allow 'Nginx HTTP'

ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//' #172.17.0.2