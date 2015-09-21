FROM     java:openjdk-7u79-jdk
MAINTAINER Wang Qiang <wangqiang8511@gmail.com>


# Install zookeeper
ENV SRC_PATH /opt
ENV ZK_PATH $SRC_PATH/zookeeper
RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz \
  | tar -xzf - -C $SRC_PATH \
  && mv $SRC_PATH/zookeeper-3.4.6 $ZK_PATH

# Add exhibitor 
COPY exhibitor-1.5.5.jar $ZK_PATH/
RUN mkdir -p /scripts
COPY scripts/setup.sh /scripts/
COPY conf/exhibitor.conf $ZK_PATH/conf/

WORKDIR $ZK_PATH
RUN mkdir -p /data/zookeeper/log
ENV ZOOKEEPER_LOG_DIR /data/zookeeper/log

#ENTRYPOINT ["/scripts/setup.sh"]
CMD ["java", "-jar", "exhibitor-1.5.5.jar", "-c", "none", "--noneconfigdir", "/data", "--defaultconfig", "conf/exhibitor.conf"]
