## Docker Flume Dockerfile

This repository contains **Dockerfile** of [Apache Flume](flume.apache.org) for [Docker](https://www.docker.com/) [automated build](https://registry.hub.docker.com/u/cogniteev/flume/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

### Base Docker Image

* [ubuntu:14.04](https://registry.hub.docker.com/_/ubuntu/)

### Installation

1. Install [Docker](https://www.docker.com/)
1. Download [automated build](https://registry.hub.docker.com/u/cogniteev/flume/): `docker pull cogniteev/flume`

# Content

* [Oracle Java JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html) 8 1.8.0_74
* [Apache Flume](https://flume.apache.org/) 1.6.0
* [Kite's API](http://kitesdk.org/) 2.2.0
* Hadoop:
    - 1.2.1
    - 2.7.2
* Gradle 2.11

### Usage

This repository provides 2 different tags:

* `1.6.0`: a raw image containing distributed software listed above.
* `1.6.0-onbuild`: that ease creation and distribution of your own Flume agents as Docker images, containing:
    * agent configuration
    * custom Java interceptors
    * Morphline interceptors.
    * HDFS sinks for both Hadoop 1 and Hadoop 2

### How to use the `1.6.0-onbuild` tag ?

### License

The `cogniteev/flume` image is licensed under the Apache License, Version 2.0.
See LICENSE for full license text.
