# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# If this file is placed at FLUME_CONF_DIR/flume-env.sh, it will be sourced
# during Flume startup.

# Environment variables can be set here.

# Give Flume more memory and pre-allocate, enable remote monitoring via JMX
export JAVA_OPTS="-Xms100m -Xmx2000m -Dcom.sun.management.jmxremote"

if [ "x$WITH_HADOOP1" != x ] ; then
    # Add hadoop jar to classpath
    HADOOP_HOME="$HADOOP_INSTALL_DIR"
    FLUME_CLASSPATH="$HADOOP_INSTALL_DIR/hadoop-core-1.2.1.jar"
elif [ "x$WITH_HADOOP2" != x ] ; then
    HADOOP_HOME="$HADOOP2_INSTALL_DIR"
    for subdir in hdfs common; do
        FLUME_CLASSPATH="$FLUME_CLASSPATH:$HADOOP2_INSTALL_DIR/share/hadoop/$subdir/hadoop-${subdir}-${HADOOP2_VERSION}.jar"
    done
fi

# Add kite libraries in classpath
for jar in \
    kite-morphlines-core-1.1.0.jar \
    metrics-core-3.0.2.jar \
    metrics-healthchecks-3.0.2.jar \
    config-1.0.2.jar ; do
    FLUME_CLASSPATH="$FLUME_CLASSPATH:$KITE_INSTALL_DIR/kite-morphlines/$jar"
done

# Custom jar added or build by child Docker image
for jar in `find /var/src/agent/extra-jars -name '*.jar' -type f -maxdepth 1`; do
    FLUME_CLASSPATH="$FLUME_CLASSPATH:$jar"
done

# Add tools.jar to classpath to compile inline java in Morphline config
FLUME_CLASSPATH="$FLUME_CLASSPATH:$JAVA_HOME/lib/tools.jar"
