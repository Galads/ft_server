FROM debian:buster

COPY src/script_install.sh ./
RUN bash script_install.sh

RUN apt-get -y install systemd
RUN nginx

COPY src/config_for_nginx ./etc/nginx/sites-available
COPY src/configure_shell_nginx.sh ./
COPY src/etc_hosts_config ./etc/

RUN bash configure_shell_nginx.sh
COPY src/index.html ./var/www/test.loc/

COPY src/install_wordpress.sh ./
RUN bash install_wordpress.sh

COPY src/index.php /var/www/test.loc

COPY commands/run_script.sh ./
CMD ["/bin/bash","run_script.sh"]

EXPOSE 80


#commands
#docker build -t mytest .
#docker run -it -p 8080:80 --rm mytest
#docker system prune -a
