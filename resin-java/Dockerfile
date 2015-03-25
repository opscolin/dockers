FROM opscolin/centos:latest
MAINTAINER Colin <bsply@126.com>
RUN yum install -y tar 
RUN wget http://192.168.68.9/download/jdk-7u40-linux-x64.rpm
RUN wget http://192.168.68.9/download/resin-4.0.40.tar.gz
RUN rpm -ivh jdk-7u40-linux-x64.rpm
RUN echo "JAVA_HOME=/usr/java/jdk1.7.0_60">>/etc/profile && echo "PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH" >>/etc/profile && source /etc/profile
RUN tar -zxvf resin-4.0.40.tar.gz && cd resin-4.0.40 && ./configure --prefix=/usr/local/resin   && make && make install
ADD resin.xml /tmp/resin.xml
ADD start_kk.sh /usr/bin/start_kk.sh 
RUN cp /tmp/resin.xml /usr/local/resin/conf/
EXPOSE 9093 22
ENTRYPOINT ["/usr/bin/start_kk.sh"]



