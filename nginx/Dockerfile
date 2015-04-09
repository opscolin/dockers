## build nginx 1.7.4 docker image 
FROM dockercolin/centos
MAINTAINER Colin <bsply@126.com>
ENV REFRESHED_AT 2015-04-08
ENV NGINX_HOME /usr/local/nginx
RUN yum install -y gcc gcc-c++ make unzip 
RUN wget http://zlib.net/zlib-1.2.8.tar.gz && tar -zxf zlib-1.2.8.tar.gz 
RUN wget http://sourceforge.net/projects/pcre/files/pcre/8.36/pcre-8.36.zip && unzip pcre-8.36.zip 
RUN wget http://nginx.org/download/nginx-1.7.4.tar.gz  && tar -zxf nginx-1.7.4.tar.gz 
RUN cd nginx-1.7.4 && ./configure --prefix=/usr/local/nginx --with-pcre=/pcre-8.36 --with-zlib=/zlib-1.2.8 && make && make install
RUN ssh-keygen -A
EXPOSE 80 443
ADD start.sh /usr/sbin/start
## set Volume
VOLUME ["/var/www/html"]
RUN sed -i  '$a export PATH=$PATH:/usr/local/nginx/sbin/' /etc/profile && source /etc/profile
WORKDIR /usr/local/nginx
#ENTRYPOINT ["sbin/nginx","-c","conf/nginx.conf"]
ENTRYPOINT ["/usr/sbin/start"]
