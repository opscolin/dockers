FROM centos
MAINTAINER Colin(bsply@126.com)
RUN export LANG=en_US.UTF-8
RUN groupadd -r redis && useradd -r -g redis redis
RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y redis
VOLUME ["/usr/local/redis/logs","/usr/local/redis/var"]
RUN chown -R redis:redis /usr/local/redis
WORKDIR /usr/local/redis/conf/
ADD redis.conf /etc/redis.conf
ADD sysctl.conf /etc/sysctl.conf
EXPOSE 6379
ENTRYPOINT  ["/usr/sbin/redis-server"]
CMD  ["/etc/redis.conf"]
