About this repository
==================================

SSH Dockerfile
----------------------------------
  This repository is for building `my own basic images` with ssh published to the public Docker Hub Registry.

### Base Image <br/>
  centos:latest
  
### Installation <br/>
    1,install Docker first 
    2,download this Dockerfile to your server ,e.g /tmp/docker
    3,enter into /tmp/docker and build 
      cd /tmp/docker
      wget 
      docke build -t opscolin/centos:latest .
      
### Usage <br/>
    docker run -d -p 2222:22 opscolin/centos:colin /usr/sbin/sshd -D
  
    [root@localtest Dockerfiles]# docker ps -a
    CONTAINER ID        IMAGE                   COMMAND                CREATED             STATUS                         PORTS               NAMES
    `157dc35ec739`        opscolin/centos:colin   "/usr/sbin/sshd -D"    2 seconds ago       Up 1 seconds                                       backstabbing_kirch 
    after enter the container 
    [root@d15a9e8667b7 ~]# ifconfig|grep inet
    inet 172.17.1.5  netmask 255.255.0.0  broadcast 0.0.0.0
    inet6 fe80::42:acff:fe11:105  prefixlen 64  scopeid 0x20<link>
    inet 127.0.0.1  netmask 255.0.0.0
    inet6 ::1  prefixlen 128  scopeid 0x10<host>
    [root@d15a9e8667b7 ~]# hostname
    `d15a9e8667b7`

