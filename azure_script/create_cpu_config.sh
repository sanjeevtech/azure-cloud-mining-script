#!/usr/bin/env bash

if [ -z "$1" ] ||  [ $1 -eq 0 ]
    then
    NUMCORES=$(nproc)
    else
    NUMCORES=$1
 fi
 
echo '"cpu_threads_conf" :'
echo '['
 
{ "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 0 },
{ "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 1 },
{ "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 2 },
{ "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : 3 },

echo '],'

 
 
