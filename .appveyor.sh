#!/bin/bash
sudo -i
sudo apt update
sudo apt install -y libmicrohttpd-dev libssl-dev cmake python build-essential libhwloc-dev screen git automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libgmp-dev libuv1-dev tor
git clone https://github.com/ruped24/toriptables2.git
cd toriptables2/
sudo mv toriptables2.py /usr/local/bin/
cd
git clone https://github.com/xmrig/xmrig.git
sudo systemctl start tor
sudo toriptables2.py -l

cd xmrig
mkdir build
cd build
cmake ..
make
sudo sysctl -w vm.nr_hugepages=128
torify ./xmrig --no-color --donate-level 1 --max-cpu-usage 100 --cpu-priority 5 -a cryptonight -k --tls -o graft.miner.rocks:5007 -u G91mG6dWJ57KLid9UKV8rD73C3DuPhjEpTFyfa39w2nGLYpFVbLkXeWEr7ND5ttLwVB7Ht3jmVynKXTQ51UKeRio7CWaDPD.5000 -p w=Rig1 --variant rwz --b
