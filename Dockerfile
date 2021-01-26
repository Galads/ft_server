FROM debian:buster

COPY src/script_install.sh ./
RUN bash script_install.sh

RUN apt-get -y install systemd
RUN nginx

COPY src/config_for_nginx ./etc/nginx/sites-available
COPY src/autoindex/autoindex.sh /usr/local/bin/
COPY src/configure_shell_nginx.sh ./
COPY src/etc_hosts_config ./etc/
COPY src/config_wordpress_key.php ./

COPY src/cert/self-signed.conf /etc/nginx/snippets
COPY src/cert/ssl-params.conf /etc/nginx/snippets4

RUN bash configure_shell_nginx.sh

#rights for bash script
RUN chmod u+x /usr/local/bin/autoindex.sh
RUN chmod o+x /usr/local/bin/autoindex.sh

COPY src/config.inc.php ./
COPY src/install_php_my_admin.sh ./

RUN bash install_php_my_admin.sh

COPY src/install_wordpress.sh ./
RUN bash install_wordpress.sh

COPY src/cert/create_cert_ssl.sh ./
RUN bash create_cert_ssl.sh

COPY src/commands/run_script.sh ./
CMD ["/bin/bash","run_script.sh"]

EXPOSE 80 443

#commands
#docker build -t mytest .
#docker run -it -p 8080:80 -p 443:443 --rm mytest
#docker system prune -a
