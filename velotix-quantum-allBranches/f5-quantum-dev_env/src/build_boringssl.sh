#!/bin/sh

cd /usr/local

# Install BoringSSL
git clone --branch master https://github.com/open-quantum-safe/boringssl.git 
git clone --branch main --single-branch --depth 1 https://github.com/open-quantum-safe/liboqs.git
cd liboqs && cd build
cmake -G"Ninja" -DCMAKE_INSTALL_PREFIX=< BORINGSSL_DIR >/oqs -DOQS_USE_OPENSSL=OFF ..
ninja
ninja install
cd /usr/local/boringssl
mkdir build && cd build
cmake -GNinja ..
ninja