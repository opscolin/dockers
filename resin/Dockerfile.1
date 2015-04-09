## Build resin 4.0.40
FROM dockercolin/jdk:1.7.60
MAINTAINER  Colin
ENV REFRESHED_AT 2015-04-08
RUN yum install -y wget tar gcc gcc-c++ make 
RUN wget http://www.caucho.com/download/resin-4.0.40.tar.gz
RUN tar -zxvf resin-4.0.40.tar.gz && cd resin-4.0.40 && ./configure --prefix=/usr/local/resin   && make && make install
RUN rm -rf resin-4.0.40*
VOLUME ["/www"]
EXPOSE 8080 9093
ADD start_kk.sh /usr/bin/start
ENTRYPOINT ["/usr/bin/start"]
CMD ["demo"]
