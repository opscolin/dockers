About this repository
==================================

resin-java Dockerfile
----------------------------------
  This repository is for building `my own basic images` with ssh published to the public Docker Hub Registry.

### Base Image <br/>
    centos:latest
    This images is built by own and installed some basic command like : net-tools,wget ,tar ,hostname commands 
    and for net-tools ,it includes ifconfig ,ping ,lookup and so one .
  
### Installation <br/>
    1,install Docker first 
    2,download this Dockerfile and related files to your server ,e.g /tmp/docker
    3,enter into /tmp/docker and build 
      cd /tmp/docker
      wget https://github.com/opscolin/dockers/blob/master/resin-java/Dockerfile
      docke build --rm -t opscolin/resin-java .
      
### Usage <br/>
    docker run -d -v /www/kkhulu:/www/kkhulu -p 2222:22 -p 9093:9093 opscolin/resin-java:lastest /usr/bin/start_kk.sh
    
    ## start container
    [root@localtest resin-java]# docker run -d -v /www/kkhulu/:/www/kkhulu/ -p 2222:22 -p 9093:9093 --name kkhulu opscolin/resin-java /usr/bin/start_kk.sh
    3261feb0b4e7bc827dd2c6717c7ceb0baf72c169a35617ed3c06d03dbfa17717
    
    ## check if start
    [root@localtest resin-java]# docker ps -a
    CONTAINER ID        IMAGE                        COMMAND                CREATED             STATUS              PORTS                                          NAMES
    3261feb0b4e7        opscolin/resin-java:latest   "/usr/bin/start_kk.s   2 seconds ago       Up 2 seconds        0.0.0.0:2222->22/tcp, 0.0.0.0:9093->9093/tcp   kkhulu              
    
    ## try to login into this container 
    [root@localtest resin-java]# ssh 192.168.68.9 -p 2222
    root@192.168.68.9's password: 
    Last login: Tue Mar 24 10:32:59 2015 from 192.168.68.9
    
    ## and try to check if resin service is up 
    [root@3261feb0b4e7 ~]# ps -ef|grep resin 
    root        49     1 11 03:45 ?        00:00:04 /usr/java/jdk1.7.0_40/bin/java -Dresin.watchdog=kkhulu -Djava.util.logging.manager=com.caucho.log.LogManagerImpl -Djavax.management.builder.initial=com.caucho.jmx.MBeanServerBuilderImpl -Djava.awt.headless=true -Djava.awt.headlesslib=true -Dresin.home=/usr/local/resin/ -Dresin.root=/usr/local/resin/ -Xrs -Xss256k -Xmx32m -d64 -server com.caucho.boot.WatchdogManager -server kkhulu start --log-directory /usr/local/resin/log
    root        97    49 26 03:45 ?        00:00:09 /usr/java/jdk1.7.0_40/bin/java -Xms1g -Xmx1g -Xss256k -XX:MaxNewSize=256k -XX:SurvivorRatio=4 -XX:ReservedCodeCacheSize=96m -XX:MaxPermSize=512m -XX:MaxTenuringThreshold=20 -XX:CMSInitiatingOccupancyFraction=70 -XX:+UseG1GC -XX:+CMSClassUnloadingEnabled -XX:+UseCMSCompactAtFullCollection -XX:+DoEscapeAnalysis -XX:+AggressiveOpts -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=51517 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dspring.profiles.active=prod -Dresin.server=kkhulu -Djava.util.logging.manager=com.caucho.log.LogManagerImpl -Djava.system.class.loader=com.caucho.loader.SystemClassLoader -Djava.endorsed.dirs=/usr/java/jdk1.7.0_40/jre/lib/endorsed:/usr/local/resin//endorsed:/usr/local/resin//endorsed -Djavax.management.builder.initial=com.caucho.jmx.MBeanServerBuilderImpl -Djava.awt.headless=true -Djava.awt.headlesslib=true -Dresin.home=/usr/local/resin/ -d64 -server com.caucho.server.resin.Resin --root-directory /usr/local/resin/ -conf /usr/local/resin/conf/resin.xml -server kkhulu -socketwait 41794 -server kkhulu start --log-directory /usr/local/resin/log
    root       185   168  0 03:46 pts/0    00:00:00 grep --color=auto resin
    [root@3261feb0b4e7 ~]# 
    
    ## at last you can use URL to check if website is ok 
    echo "hello jsp for container" >/www/kkhulu/index.jsp
    http://your-host-ip:9093
    

