#!/bin/bash

sudo mkdir /mnt/data/dnsmasq
sudo mkdir /mnt/data/traefik
sudo mkdir /mnt/data/traefik/foward_auth/
sudo cp -r ./dnsmasq/* /mnt/data/dnsmasq
sudo cp -r ./foward_auth/* /mnt/data/traefik/foward_auth/

docker-compose up -d
