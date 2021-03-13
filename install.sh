#!/bin/bash
cd /tmp
sudo apt update
# CERTIFICADOS SSL
sudo apt install -y certbot
sudo apt install -y python-certbot-apache
# RENOVACAO AUTOMATICA SSL
sudo echo "SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 */12 * * * root certbot -q renew --apache" >> /etc/cron.d/certbot
# INSTALACAO DO BOOKSTACK
sudo wget https://raw.githubusercontent.com/BookStackApp/devops/master/scripts/installation-ubuntu-18.04.sh
sudo chmod a+x installation-ubuntu-18.04.sh
sudo ./installation-ubuntu-18.04.sh
# CRIAR SWAP
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
# CONFIGURAR HORARIO (BUENOS AIRES = BRASILIA SEM HORARIO DE VERAO)
sudo timedatectl set-timezone America/Argentina/Buenos_Aires
