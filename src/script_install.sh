apt-get -y update
apt install -y ufw
ufw enable -y
apt-get -y install nginx
ufw app list
ufw allow 'Nginx HTTP'
#ufw status
#systemctl status nginx
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//' #172.17.0.2