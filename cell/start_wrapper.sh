#!/usr/bin/env bash 

## start wrapper service 
workdir=/var/catfish/cell/bin

## enter and start
echo "starting wrapper "
cd $workdir
./wrapper -c ../conf/wrapper.conf
