# MySQL dockerfile with master-slave 


## build image 
  docker build --rm -t dockercolin/mysql_ms:5.6.24 .

## get image 
  docker pull dockercolin/mysql_ms:5.6.24

## set container

### as normal mysql server 
  docker run -d -p 33306:3306 dockercolin/mysql_ms:5.6.24

### as normal mysql server with customed config file or data folder
  docker run -d -p 3306:3306 -v /tmp/my.cnf:/etc/my.cnf -v /data/mysql5.6.24:/var/lib/mysql dockercolin/mysql_ms:5.6.24 

### as master-slave 
  # set master
    docker run -d -p 3306:3306 --name='master' -e REPLICATION_MASTER=true dockercolin/mysql_ms:5.6.24
  # set slave 
  d ocker run -d -p 3307:3306 --name='slave' -e REPLICATION_SLAVE=true --link master:`mysql` dockercolin/mysql_ms:5.6.24
  
  # you cat set customed replicated-db in my.cnf 
  master node:  -v /tmp/my-master.cnf:/etc/my.cnf
  slave node:   -v /tmp/my-slave.cnf:/etc/my.cnf
