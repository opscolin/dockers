#!/bin/bash 
set -e
/usr/local/resin/bin/resin.sh -server kkhulu start
/usr/sbin/sshd -D
