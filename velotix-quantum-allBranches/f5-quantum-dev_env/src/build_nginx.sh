#!/bin/sh

# multi-threaded make "-j"
RAPID=""

# Read flags
while getopts j:f: flag
do
    case "${flag}" in
        j) RAPID=${OPTARG};;
    esac
done

cd /usr/local

# Install NGINX-1.20 stable from source
wget http://nginx.org/download/nginx-1.20.0.tar.gz 
tar -xzf nginx-1.20.0.tar.gz
rm nginx-1.20.0.tar.gz
cd nginx-1.20.0
./configure --prefix=/usr/local/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf \
    --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --with-http_stub_status_module \
    --with-pcre --with-zlib=/usr/local/zlib-1.2.12 --pid-path=/var/run/nginx.pid --with-http_ssl_module \
    --modules-path=/etc/nginx/modules --with-http_v2_module --with-stream \
    --with-cc-opt="-I /usr/local/openssl/oqs/include" --with-ld-opt="-L /usr/local/openssl/oqs/lib"
sed -i "s/libcrypto.a/libcrypto.a -loqs/g" objs/Makefile
make $RAPID
make install

# Verify installation
nginx -V