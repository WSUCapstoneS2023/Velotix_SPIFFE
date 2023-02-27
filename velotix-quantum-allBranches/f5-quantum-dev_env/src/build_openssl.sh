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

# Install PCRE
wget https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.39/pcre2-10.39.tar.gz
tar -xzf pcre2-10.39.tar.gz
rm pcre2-10.39.tar.gz
cd pcre2-10.39
./configure
make $RAPID
make install

cd /usr/local

# Install zlib
wget http://zlib.net/zlib-1.2.12.tar.gz
tar -xzf zlib-1.2.12.tar.gz
rm zlib-1.2.12.tar.gz
cd zlib-1.2.12
./configure
make $RAPID
make install

cd /usr/local

# Install OpenSSL
wget http://www.openssl.org/source/openssl-1.1.1g.tar.gz
tar -xzf openssl-1.1.1g.tar.gz
cd openssl-1.1.1g
./config
make $RAPID
make install

cd /usr/local

# Install OQS-OpenSSL fork
git clone --branch OQS-OpenSSL_1_1_1-stable https://github.com/open-quantum-safe/openssl.git
git clone --branch main https://github.com/open-quantum-safe/liboqs.git
cd liboqs
mkdir build
cd build
cmake -GNinja -DCMAKE_INSTALL_PREFIX=< OPENSSL_DIR >/openssl/oqs ..
ninja
ninja install
cd /usr/local/openssl
./Configure no-shared linux-x86_64 -lm
make $RAPID