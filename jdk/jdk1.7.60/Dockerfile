## build jdk1.8.60 with centos7
FROM centos:centos7
MAINTAINER Colin <1209755822@qq.com>
ENV REFRESHED_AT 2015-04-09
RUN yum install -y wget tar
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jdk-8u40-linux-x64.rpm"
RUN rpm -ivh jdk-8u40-linux-x64.rpm && rm -rf jdk-8u40-linux-x64.rpm
