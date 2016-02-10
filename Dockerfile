# Build Flume and apply some patches
FROM cogniteev/oracle-java:java7

RUN apt-get update && apt-get install -y maven curl patch git

ADD scripts /var/src/scripts
ADD patches /var/src/flume-patches

ENV FLUME_VERSION=1.6.0
ENV FLUME_INSTALL_DIR=/var/flume
RUN /var/src/scripts/01-install-flume

ENV KITE_VERSION=1.1.0
ENV KITE_INSTALL_DIR=/var/kite
RUN /var/src/scripts/02-install-kite

ENV HADOOP_VERSION=1.2.1
ENV HADOOP_INSTALL_DIR=/var/hadoop
RUN /var/src/scripts/03-install-hadoop

ENV GRADLE_VERSION=2.11
ENV GRADLE_INSTALL_DIR=/var/gradle
RUN /var/src/scripts/04-install-gradle
ENV PATH="$GRADLE_INSTALL_DIR/bin:$PATH"

WORKDIR /var/flume
CMD bin/flume-ng

