FROM debian:buster

COPY src/script_install.sh ./
RUN bash script_install.sh
RUN nginx

EXPOSE 80
