FROM debian:buster

COPY src/script_install.sh ./
RUN bash script_install.sh
CMD nginx

EXPOSE 80