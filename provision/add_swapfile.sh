#!/bin/sh
fallocate -l 4G /swapfile
chmod 0600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile non swap sw 0 0' >> /etc/fstab
