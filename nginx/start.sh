#!/usr/bin/env bash 

## start nginx 
echo "start nginx"
cd /usr/local/nginx
sbin/nginx -c conf/nginx.conf
## start ssh
echo "start ssh"
/usr/sbin/sshd -D
