service nginx restart
service php7.3-fpm start
service mysql start

echo "CREATE DATABASE example_database" | mysql -u root
echo "GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO
                                'pma'@'localhost' IDENTIFIED BY 'pass';" | mysql -u root

echo "FLUSH PRIVILEGES;" | mysql -u root

mysql -u root < usr/share/phpmyadmin/sql/create_tables.sql

ln -s /usr/share/phpmyadmin /var/www/test.loc/

#wordpress database
echo "CREATE DATABASE wordpress" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO
                                'pma'@'localhost' IDENTIFIED BY 'pass';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
bash