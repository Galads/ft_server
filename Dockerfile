FROM debian:buster

COPY srcs/script_install.sh ./
RUN bash script_install.sh

RUN apt-get -y install systemd
RUN nginx

COPY srcs/config_for_nginx ./etc/nginx/sites-available
COPY srcs/autoindex/autoindex.sh /usr/local/bin/
COPY srcs/configure_shell_nginx.sh ./
COPY srcs/etc_hosts_config ./etc/
COPY srcs/config_wordpress_key.php ./

COPY srcs/cert/self-signed.conf /etc/nginx/snippets
COPY srcs/cert/ssl-params.conf /etc/nginx/snippets

RUN bash configure_shell_nginx.sh

#rights for bash script
RUN chmod u+x /usr/local/bin/autoindex.sh
RUN chmod o+x /usr/local/bin/autoindex.sh

COPY srcs/config.inc.php ./
COPY srcs/install_php_my_admin.sh ./

RUN bash install_php_my_admin.sh

COPY srcs/install_wordpress.sh ./
RUN bash install_wordpress.sh

COPY srcs/cert/create_cert_ssl.sh ./
RUN bash create_cert_ssl.sh

COPY srcs/commands/run_script.sh ./
CMD ["/bin/bash","run_script.sh"]

EXPOSE 80 443

#commands
#docker build -t mytest .
#docker run -it -p 8080:80 -p 443:443 --rm mytest
#docker system prune -a