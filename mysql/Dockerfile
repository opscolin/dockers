FROM dockercolin/centos:youyuan
MAINTAINER Colin

## INSTALL
RUN yum install -y http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
RUN yum install -y mysql-community-server

## CLEAN
RUN yum clean all

## ADD CONFIG
ADD my_basic.cnf /etc/my.cnf
ADD my_charset.cnf /etc/mysqld_charset.cnf

## ADD MYSQL SCRIPTS
#ADD start.sh /start.sh

## SET MYSQL USER AND PASSWD
ENV MYSQL_USER admin
ENV MYSQL_PASSWD **RANDOM**

## SET REPLICATION RELATED
ENV REPLICATION_MASTER **FALSE**
ENV REPLICATION_SLAVE **FALSE**
ENV REPLICATION_USER replica
ENV REPLICATION_PASS replica

## SET VOLUME
VOLUME ["/var/lib/mysql"]

## EXPOSE PORT
EXPOSE 3306

## ADD MYSQL SCRIPTS
ADD start.sh /start.sh
## start
ENTRYPOINT ["/start.sh"]
