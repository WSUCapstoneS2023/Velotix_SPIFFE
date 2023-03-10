#!/bin/sh

# Run from CWD using "./init.sh"

# Build image
sudo docker build -t tls-test-img .

# Create network
#sudo docker network create test_net

# Run container
sudo docker run --network host --name tls-test-img -p 443:443 tls-test-img