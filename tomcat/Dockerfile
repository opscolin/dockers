## build tomcat 7.0.59 on centos7_jdk:1.7.60
FROM dockercolin/centos7_jdk:1.7.60
MAINTAINER Colin <1209755822@qq.com>
ENV REFRESHED_AT 2015-04-09
ENV TOMCAT_MAJOR 7
ENV TOMCAT_VERSION 7.0.59
ENV CATALINA_HOME /usr/local/tomcat
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME
#RUN curl -SL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz && tar -zxf tomcat.tar.gz --strip-components=1 && rm bin/*.bat && rm tomcat.tar.gz*
RUN wget -nv --output-document=tomcat.tar.gz $TOMCAT_TGZ_URL && tar -zxf tomcat.tar.gz --strip-components=1 && rm bin/*.bat && rm tomcat.tar.gz*
#RUN ln -s bin/catalina.sh /usr/bin/catalina.sh
#RUN ls -l bin/catalina.sh && ls -l /usr/bin/catalina.sh
EXPOSE 8080
ENTRYPOINT ["/usr/local/tomcat/bin/catalina.sh", "run"]
