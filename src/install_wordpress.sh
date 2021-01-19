apt-get install -y mariadb-server mariadb-client
apt-get install -y php7.3-mysql php7.3-curl php7.3-json php7.3-cgi php7.3 php7.3-xml
apt-get install -y php-fpm php-mysql

#wordpress
cd /tmp
curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
cp -a /tmp/wordpress/. /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress
cat /config_wordpress_key.php > /var/www/wordpress/wp-config.php

ln -s /var/www/wordpress /var/www/test.loc/

##wordpress database
#echo "CREATE DATABASE wordpress" | mysql -u root
#echo "GRANT SELECT, INSERT, UPDATE, DELETE ON wordpress.* TO
#                                'pma'@'localhost' IDENTIFIED BY 'pass';" | mysql -u root
#echo "FLUSH PRIVILEGES;" | mysql -u root