# nexus dockerfile
FROM ubuntu
MAINTAINER MikeyB

WORKDIR /opt/
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -f

## installing java
RUN  wget --no-cookies \
     --no-check-certificate \
     --header "Cookie: oraclelicense=accept-securebackup-cookie" \
     "http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz"

RUN tar zxvf jdk-8u111-linux-x64.tar.gz

RUN update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_111/bin/java 100
RUN update-alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_111/bin/javac 100

# setting the enviroment var
RUN export JAVA_HOME=/opt/jdk1.8.0_111/bin/java

## installing nexus
RUN wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.2-02-unix.tar.gz
RUN tar -zxvf nexus-3.0.2-02-unix.tar.gz

EXPOSE 8082:8081
ENTRYPOINT /opt/nexus-3.0.2-02/bin/nexus start && bash
