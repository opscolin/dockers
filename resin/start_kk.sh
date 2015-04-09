#!/usr/bin/env bash
set -e
echo "start resin "
/usr/local/resin/bin/resin.sh -server $1  start
## make sure resin container running 
echo "start ssh"
/usr/sbin/sshd -D

