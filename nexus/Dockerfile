# nexus dockerfile
FROM ubuntu:java8
MAINTAINER MikeyB

WORKDIR /opt/
RUN apt-get update
RUN apt-get install -y wget
RUN wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.2-02-unix.tar.gz
RUN tar -zxvf nexus-3.0.2-02-unix.tar.gz
RUN chmod a+x /opt/nexus-3.0.2-02/bin/nexus
EXPOSE 8082:8081
ENTRYPOINT /opt/nexus-3.0.2-02/bin/nexus start && bash
