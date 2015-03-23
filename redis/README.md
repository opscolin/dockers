About this repository
===================================

Redis Dockerfile
-----------------------------------

  This repository is for building Redis images published to the public Docker Hub Registry.
  
Base image 
------------------------------

  `centos`
  
Installation
--------------------------------
    1,install Docker first 
    2,download this Dockerfile to your server ,e.g /tmp/docker
    3,enter into /tmp/docker and build 
      cd /tmp/docker
      docke build -t opscolin/redis:latest .

Usage:
-------------------------------

### Run redis-server  <br/>
    docker run -d --name redis_server opscolin/redis_latest
    here you can use "docker ps -l" to check the container state started just now 
    [root@localtest Dockerfiles]# docker ps -l
    CONTAINER ID        IMAGE                   COMMAND                CREATED             STATUS                      PORTS               NAMES                      ecstatic_pare       
    263f6e42a126        opscolin/redis:latest   "/usr/sbin/redis-ser   18 minutes ago      Up 18 minutes               6379/tcp            redis_server
  
### Run redis-server with persistent data directory. (creates appendonly.aof) <br/> 
    docker run -d --name redis_server -v /Data/redis:/usr/local/redis/var opscolin/redis:lastest
  
### Run redis-server with persistent data directory and password. <br/>
    docker run -d -p 6379:6379 -v /Data/redis:/usr/local/redis/var --name redis_server opscolin/redis:latest --requirepass <password> 
  
### link redis_server container with another container  <br/>
    docker run -i -t --link redis_server:db opscolin/centos:colin /bin/bash
    after enter the new container , 
    env |grep 'DB'
    [root@1555a91037cd /]# env |grep DB
    DB_NAME=/ecstatic_pare/db
    DB_PORT_6379_TCP_PORT=6379
    DB_PORT=tcp://172.17.1.1:6379
    DB_PORT_6379_TCP=tcp://172.17.1.1:6379
    DB_PORT_6379_TCP_ADDR=172.17.1.1
    DB_PORT_6379_TCP_PROTO=tcp
    [root@1555a91037cd /]# redis-cli -h ${DB_PORT_6379_TCP_ADDR} -p ${DB_PORT_6379_TCP_PORT}
    redis 172.17.1.1:6379>
    redis 172.17.1.1:6379> keys *
    1) "Bname"
    2) "hello"
    3) "name"
    redis 172.17.1.1:6379> get Bname
    "Betty"
