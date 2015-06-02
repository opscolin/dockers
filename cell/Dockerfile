## build cell wrapper service 
FROM dockercolin/sunjdk:1.7.60
MAINTAINER Colin 
VOLUME /var/catfish
EXPOSE 8888
ADD start_wrapper.sh /usr/bin/wrapper
ENTRYPOINT ["/usr/bin/wrapper"]
