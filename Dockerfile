FROM quay.io/cogniteev/flume:1.6.0

ADD conf/* /var/src/agent/conf/
ADD scripts/* /var/src/scripts/

ENV AGENT_ROOT_DIR=/var/src/agent
ENV AGENT_CONFIG_DIR=${AGENT_ROOT_DIR}/conf
ONBUILD ADD conf /var/src/agent/conf
ONBUILD RUN mkdir -p /var/src/agent/extra-jars
ONBUILD ADD extra-jars/* /var/src/agent/extra-jars
ONBUILD ADD extra-src /var/src/agent/extra-src
ONBUILD RUN /var/src/scripts/10-build-extra-src

ENTRYPOINT ["/var/src/scripts/20-start-agent"]
