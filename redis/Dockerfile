FROM dockercolin/centos:youyuan
MAINTAINER Colin
# SET VARIABLE
ENV REDIS_SLAVE **RANDOM**
ENV REDIS_HOME /usr/local/reids/

# add redis
RUN groupadd -r redis && useradd -r -g redis redis

# install
#ADD install3.sh /install.sh
#RUN /install.sh
RUN yum install -y wget tar make gcc
RUN wget http://download.redis.io/releases/redis-3.0.0.tar.gz && tar -zxf redis-3.0.0.tar.gz 
RUN cd redis-3.0.0 && make && make install && cp src/redis-cli src/redis-server /usr/sbin/
RUN mkdir -p /usr/local/redis/{conf,bin,logs,var} && chown -R redis:redis /usr/local/redis

# clean
RUN yum clean all && rm -rf redis-3.0.0.tar.gz
# need to set in start script
#RUN export PATH=$PATH:${REDIS_HOME}


# set volume
VOLUME ["/usr/local/redis/"]

# add configuration file
ADD redis.conf /etc/redis.conf
ADD sysctl.conf /etc/sysctl.conf

# add start scripts
ADD run.sh /run.sh

# expose port 
EXPOSE 6379

# entrypoint 
ENTRYPOINT ["/run.sh"]
