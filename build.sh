#!/bin/bash

printf "Create docker traefik bridge: traefik-bridge ..."
echo
sudo docker network create --attachable -d bridge inethi-bridge-traefik

printf "Pulling dnsmasq and traefik..."
echo

# Build traefik - compulsory docker
printf "Building Traefik and dnsmasq docker... "
    cd ./traefik-with-dnsmasq
    ./local_build.sh
    cd ..

# Cannot start due to current bind
printf "EXPECTED FAILIURE"
echo
# Disable current dns so dnsmasq can bind to 0.0.0.0:53
printf "Disabling current system dns..."
echo
sudo systemctl disable systemd-resolved.service
sudo service systemd-resolved stop
sudo rm /etc/resolv.conf

printf "Re-building Traefik and dnsmasq docker... "
  docker restart inethi-dnsmasq
  cd ./traefik-with-dnsmasq
  ./local_build.sh
  cd ..
