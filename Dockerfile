# Build Flume and apply some patches
FROM cogniteev/oracle-java:java8

RUN apt-get update && apt-get install -y maven curl patch git


ENV FLUME_VERSION=1.6.0
ENV FLUME_INSTALL_DIR=/var/flume
ADD patches /var/src/flume-patches
ADD scripts/01-install-flume /var/src/scripts/
RUN /var/src/scripts/01-install-flume

ENV KITE_VERSION=1.1.0
ENV KITE_INSTALL_DIR=/var/kite
ADD scripts/02-install-kite /var/src/scripts/
RUN /var/src/scripts/02-install-kite

ENV HADOOP_VERSION=1.2.1
ENV HADOOP_INSTALL_DIR=/var/hadoop
ADD scripts/03-install-hadoop /var/src/scripts/
RUN /var/src/scripts/03-install-hadoop

ENV HADOOP2_VERSION=2.7.2
ENV HADOOP2_INSTALL_DIR=/var/hadoop2
ADD scripts/04-install-hadoop2 /var/src/scripts/
RUN /var/src/scripts/04-install-hadoop2

ENV GRADLE_VERSION=2.11
ENV GRADLE_INSTALL_DIR=/var/gradle
ADD scripts/05-install-gradle /var/src/scripts/
RUN /var/src/scripts/05-install-gradle
ENV PATH="$GRADLE_INSTALL_DIR/bin:$PATH"

WORKDIR /var/flume
CMD bin/flume-ng

