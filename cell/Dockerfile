## build cell wrapper service 
FROM dockercolin/bjdk:1.7.60
MAINTAINER Colin <bsply@126.com>
ENV REFRESHED_AT 2015-04-07
VOLUME /var/catfish
EXPOSE 8888
ADD start_wrapper.sh /usr/bin/wrapper
ENTRYPOINT ["/usr/bin/wrapper"]
