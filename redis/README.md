About this repository
===================================

Redis Dockerfile
-----------------------------------

  This repository is for building Redis images(include master-slave) published to the public Docker Hub Registry.
  
Base image 
------------------------------

  `dockercolin/centos:youyuan`
  
Installation
--------------------------------
    1,install Docker first 
    2,docker pull dockercolin/redis:3.0.0ms

Usage:
-------------------------------

### Run redis-server  <br/>
    docker run -d --name redis_server  dockercolin/redis:3.0.0ms
    
    here you can use "docker ps -l" to check the container state started just now 
    [root@localtest Dockerfiles]# docker ps -l
    CONTAINER ID        IMAGE                   COMMAND                CREATED             STATUS                      PORTS               NAMES                      ecstatic_pare       
    263f6e42a126        opscolin/redis:latest   "/usr/sbin/redis-ser   18 minutes ago      Up 18 minutes               6379/tcp            redis_server
  
### Run redis-server with persistent data directory. (creates appendonly.aof) <br/> 
    docker run -d --name redis_server -v /Data/redis:/usr/local/redis/var dockercolin/redis:3.0.0ms
  
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

Redis master and slave
-----------------------------------------------------------------------------
### REDIS_SLAVE
    value: slave / SLAVE
    if set this param and link to another redis-server ,this container will be a slave 
    
    # used as master-slave 
    # master
    docker run -d -p 6379:6379 --name='master' dockercolin/redis:3.0.0ms
    docker run -d -p 6379:6379 -e REDIS_SLAVE='slave' --link master:redis dockercolin/redis:3.0.0ms
    
    # additional 
      ## customed redis configuration file (config file and data folder should be like below)
      -v /tmp/redis.conf:/etc/redis.conf
      ## customed redis data folder
      -v /tmp/redis-var:/usr/local/redis/var
