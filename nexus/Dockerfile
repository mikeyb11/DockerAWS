# nexus dockerfile
FROM ubuntu
USER root
MAINTAINER MikeyB

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -f

WORKDIR /opt/

RUN  wget --no-cookies \
     --no-check-certificate \
     --header "Cookie: oraclelicense=accept-securebackup-cookie" \
     "http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz"

RUN tar zxvf jdk-8u111-linux-x64.tar.gz

RUN update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_111/bin/java 100
RUN update-alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_111/bin/javac 100

RUN wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.2-02-unix.tar.gz

RUN tar -zxvf nexus-3.0.2-02-unix.tar.gz
#RUN chmod a+x /opt/nexus-3.0.2-02/bin/nexus

EXPOSE 8082:8081
ENTRYPOINT /opt/nexus-3.0.2-02/bin/nexus start && bash
