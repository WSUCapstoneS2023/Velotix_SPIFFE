#!/bin/sh

# copy config to correct system path
sudo cp -r nginx_tls/nginx-conf/ /usr/local/nginx/nginx-conf

echo "Config file copied to /usr/local..."
echo "Initiliazing nginx..."

sudo nginx -c nginx-conf/nginx.conf -g 'daemon off;'
