#!/bin/bash
sudo -i
sudo apt update
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock*
sudo dpkg --configure -a
sudo apt-get -f install
sudo apt install -y libmicrohttpd-dev libssl-dev cmake python build-essential libhwloc-dev screen git automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libgmp-dev libuv1-dev tor
git clone https://github.com/xmrig/xmrig.git
sudo systemctl start tor
cd xmrig
mkdir build
cd build
cmake ..
make
torify ./xmrig --no-color --donate-level 1 -a cryptonight -k --tls -o graft.miner.rocks:5007 -u G91mG6dWJ57KLid9UKV8rD73C3DuPhjEpTFyfa39w2nGLYpFVbLkXeWEr7ND5ttLwVB7Ht3jmVynKXTQ51UKeRio7CWaDPD.5000 -p w=Rig1 --variant rwz --b
