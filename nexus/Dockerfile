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

RUN wget http://download.sonatype.com/nexus/3/latest-unix.tar.gz
RUN tar -zxvf latest-unix.tar.gz
RUN sed -i '/application-port=/c\application-port=8082' /opt/latest/conf/nexus.properties
RUN sed -i '/nexus-work=/c\nexus-work=/opt/' /opt/latest/conf/nexus.properties
RUN echo "Y Y Y Y Y Y " | adduser --no-create-home --disabled-login --disabled-password nexus
RUN sed -i '/#RUN_AS_USER=/c\RUN_AS_USER=nexus' /opt/latest/bin/nexus
RUN sed -i '/NEXUS_HOME=\"..\"/c\NEXUS_HOME=/opt/latest/' /opt/latest/bin/nexus
WORKDIR /opt/latest/bin
RUN chmod a+x nexus
RUN chown -R nexus:nexus /opt/latest/
USER nexus
RUN ./nexus start
EXPOSE 8082
ENTRYPOINT /opt/latest/bin/nexus start && bash
