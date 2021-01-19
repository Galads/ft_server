FROM debian:buster

COPY src/script_install.sh ./
RUN bash script_install.sh

RUN apt-get -y install systemd
RUN nginx

COPY src/config_for_nginx ./etc/nginx/sites-available
COPY src/configure_shell_nginx.sh ./
COPY src/etc_hosts_config ./etc/
COPY src/config_wordpress_key.php ./

RUN bash configure_shell_nginx.sh
COPY src/index.html ./var/www/test.loc/

#COPY src/install_wordpress.sh ./
#RUN bash install_wordpress.sh

COPY src/index.php /var/www/test.loc

COPY src/config.inc.php ./

COPY src/install_php_my_admin.sh ./
RUN bash install_php_my_admin.sh

COPY src/install_wordpress.sh ./
RUN bash install_wordpress.sh

COPY commands/run_script.sh ./
CMD ["/bin/bash","run_script.sh"]

COPY cert/create_cert_ssl.sh ./
RUN create_cert_ssl.sh


EXPOSE 80


#commands
#docker build -t mytest .
#docker run -it -p 8080:80 --rm mytest
#docker system prune -a
