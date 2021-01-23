apt-get install openssl

openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out brice.crt \
            -keyout brice.key \
            -subj "/C=SI/ST=Ljubljana/L=Ljubljana/O=Security/OU=IT Department/CN=www.brice.com"

mkdir /etc/nginx/ssl
mv /brice.crt /etc/nginx/ssl/
mv /brice.key /etc/nginx/ssl/

#ufw allow 'Nginx Full'
#ufw delete allow 'Nginx HTTP'

#may be
#openssl dhparam -out /etc/nginx/dhparam.pem 4096