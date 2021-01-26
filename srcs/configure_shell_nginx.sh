cp /etc/nginx/sites-available/default /etc/nginx/sites-available/test.loc
ln -s /etc/nginx/sites-available/test.loc /etc/nginx/sites-enabled

rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default

rm -rf /etc/nginx/html
rm -rf /var/www/html

mkdir /var/www/test.loc

cat /etc/nginx/sites-available/config_for_nginx > /etc/nginx/sites-available/test.loc
cat /etc/etc_hosts_config > hosts
cd /etc
rm etc_hosts_config
cd
rm /etc/nginx/sites-available/config_for_nginx