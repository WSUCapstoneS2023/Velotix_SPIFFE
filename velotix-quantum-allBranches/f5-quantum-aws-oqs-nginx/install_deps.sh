#!/bin/sh

# begin
echo "Beginning installation..."

# update apt-get
sudo apt-get update -y

# install dependencies and compiler
sudo apt-get install -y gcc build-essential ninja-build cmake make libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev libgd-dev libxml2 libxml2-dev uuid-dev astyle doxygen zlib1g zlib1g-dev libperl-dev wget make git autoconf automake unzip patch virtualenv docker-compose jq libunwind-dev pkg-config python3 python3-pip python3-psutil

echo "Depencies updated..."

# install pcre
cd /usr/local
sudo wget https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.39/pcre2-10.39.tar.gz
sudo tar -xzf pcre2-10.39.tar.gz
sudo rm -f pcre2-10.39.tar.gz
cd pcre2-10.39
sudo ./configure
sudo make
sudo make install

echo "PCRE installed..."

# install zlib
cd /usr/local
sudo wget http://zlib.net/zlib-1.2.12.tar.gz
sudo tar -xzf zlib-1.2.12.tar.gz
sudo rm -f zlib-1.2.12.tar.gz
cd zlib-1.2.12
sudo ./configure
sudo make
make install

echo "zlib installed..."

# install openssl vanilla
cd /usr/local
sudo wget http://www.openssl.org/source/openssl-1.1.1g.tar.gz
sudo tar -xzf openssl-1.1.1g.tar.gz
sudo rm -f openssl-1.1.1g.tar.gz
cd openssl-1.1.1g
sudo ./config
sudo make
sudo make install

echo "OpenSSL vanilla installed..."

# install oqs-openssl fork with liboqs
cd /usr/local
sudo git clone --branch OQS-OpenSSL_1_1_1-stable https://github.com/open-quantum-safe/openssl.git
sudo git clone --branch main https://github.com/open-quantum-safe/liboqs.git
cd liboqs
sudo mkdir build
cd build
sudo cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr/local/openssl/oqs ..
sudo ninja
sudo ninja install
cd /usr/local/openssl
sudo ./config --openssldir=/usr/local/ssl
sudo make
sudo make install

echo "OQS-OpenSSL fork installed with liboqs library..."

# remove vanilla openssl from path
#sudo rm -f /usr/bin/openssl 
sudo ldconfig

#echo "OpenSSL vanilla removed from /usr/bin"

# install NGINX stable from source
cd /usr/local
sudo wget http://nginx.org/download/nginx-1.20.0.tar.gz 
sudo tar -xzf nginx-1.20.0.tar.gz
sudo rm -f nginx-1.20.0.tar.gz
cd nginx-1.20.0
sudo ./configure --prefix=/usr/local/nginx --sbin-path=/usr/sbin/nginx --with-debug --with-pcre --with-zlib=/usr/local/zlib-1.2.12 --without-http_gzip_module --with-http_stub_status_module --with-http_ssl_module --modules-path=/etc/nginx/modules --with-cc-opt="-I/usr/local/openssl/oqs/include" --with-ld-opt="-L/usr/local/openssl/oqs/lib" 
sudo sed -i "s/libcrypto.a/libcrypto.a -loqs/g" objs/Makefile
sudo make 
sudo make install

echo "NGINX stable from source built..."

nginx -V