FROM centos
MAINTAINER Colin <bsply@126.com>
RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y redis
EXPOSE 6379
RUN mkdir -p /usr/local/redis/logs
RUN mkdir /usr/local/redis/var
#COPY redis.conf /usr/local/redis/conf/
ADD redis.conf /usr/local/redis/conf/
CMD ["redis-server","/usr/local/redis/conf/redis.conf"]