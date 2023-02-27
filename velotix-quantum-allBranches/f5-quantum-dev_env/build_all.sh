#!/bin/sh

# standard routes: if unchanged, will use /usr/local as installation directory
STD_ROUTES=1
# with/without BSSL
WITH_BSSL=0
# multi-threaded make "-j"
RAPID=""
# store original cwd - pass with all shell script calls
OWD=$PWD

# Read flags
while getopts s:b:j: flag
do
    case "${flag}" in
        s) STD_ROUTES=0;;
        b) WITH_BSSL=1;;
        j) RAPID="-j";;
    esac
done

echo "Beginning installation..."

cd /usr/local

# Update package manager
apt-get update -y

# Install package dependencies
apt-get install -y gcc build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev libgd-dev \
    libxml2 libxml2-dev uuid-dev astyle doxygen zlib1g zlib1g-dev liperl-dev wget make git autoconf \
    automake unzip patch virtualenv docker-compose jq libunwind-dev pkg-config python3 python3-pip python3-psutil

# Build openssl/dependencies
$OWD/src/build_openssl.sh -j $RAPID

# Build boringssl
$OWD/src/build_boringssl.sh

# Build nginx
$OWD/src/build_nginx -j $RAPID

# Build envoy
$OWD/src/build_envoy