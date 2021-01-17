FROM debian:buster

COPY src/script_install.sh ./
RUN bash script_install.sh

RUN apt-get -y install systemd
RUN nginx
#RUN nginx -s reload
#RUN apt-get -y install service
RUN service nginx restart

EXPOSE 80