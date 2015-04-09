## build apache solr on centos7 and jdk1.7.60
FROM dockercolin/centos7_jdk:1.7.60
MAINTAINER Colin <1209755822@qq.com>
ENV REFRESHED_AT 2015-04-09
ENV SOLR_VERSION 5.0.0
ENV SOLR_USER solr
ENV SOLR solr-$SOLR_VERSION
RUN groupadd -r $SOLR_USER && useradd -r -g $SOLR_USER $SOLR_USER && mkdir -p /opt && wget -nv --output-document=/opt/$SOLR.tgz http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz && tar -C /opt --extract --file /opt/$SOLR.tgz && rm /opt/$SOLR.tgz && ln -s /opt/$SOLR /opt/solr && chown -R $SOLR_USER:$SOLR_USER /opt/solr /opt/$SOLR && chmod 775 /opt/solr/bin/solr
EXPOSE 8983
WORKDIR /opt/solr
USER $SOLR_USER
ENTRYPOINT ["/opt/solr/bin/solr","-f"]
