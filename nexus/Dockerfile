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
#RUN sed -i '/application-port=/c\application-port=8082' #/opt/nexus-3.0.2-02/ets/nexus.properties
#RUN sed -i '/nexus-work=/c\nexus-work=/opt/' /opt/nexus-3.0.2-02/conf/nexus.properties
RUN echo "Y Y Y Y Y Y " | adduser --no-create-home --disabled-login --disabled-password nexus
RUN sed -i '/#RUN_AS_USER=/c\RUN_AS_USER=nexus' /opt/nexus-3.0.2-02/bin/nexus
RUN sed -i '/NEXUS_HOME=\"..\"/c\NEXUS_HOME=/opt/nexus-3.0.2-02/' /opt/nexus-2.12.0-01/bin/nexus
WORKDIR /opt/nexus-3.0.2-02/bin
RUN chmod a+x nexus
RUN chown -R nexus:nexus /opt/nexus-3.0.2-02/
USER nexus
RUN ./nexus start
EXPOSE 8082
ENTRYPOINT /opt/nexus-3.0.2-02/bin/nexus start && bash
