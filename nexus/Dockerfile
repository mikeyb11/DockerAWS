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

RUN groupadd nexus
RUN useradd -g nexus nexus
RUN wget http://download.sonatype.com/nexus/oss/nexus-2.12.0-01-bundle.tar.gz
RUN mkdir /usr/lib/nexus-oss/
WORKDIR /usr/lib/nexus-oss/
RUN tar xzvf /opt/nexus-2.12.0-01-bundle.tar.gz nexus-2.12.0-01/
RUN ln -s nexus-2.12.0-01/ nexus
RUN mkdir /srv/nexus
RUN mkdir /srv/nexus/main-repo
RUN chown nexus:nexus /srv/nexus/main-repo
RUN sed -i '/nexus-work=/c\nexus-work=/srv/nexus/main-repo/' /usr/lib/nexus-oss/nexus-2.12.0-01/conf/nexus.properties
RUN sed -i '/application-port=/c\application-port=8082' /usr/lib/nexus-oss/nexus-2.12.0-01/conf/nexus.properties
RUN sed -i '/application-host=/c\application-host=52.213.115.199' /usr/lib/nexus-oss/nexus-2.12.0-01/conf/nexus.properties
RUN cp /usr/lib/nexus-oss/nexus/bin/nexus /etc/init.d/nexus
RUN sed -i '/NEXUS_HOME=\"..\"/c\NEXUS_HOME=/usr/lib/nexus-oss/nexus' /etc/init.d/nexus
RUN sed -i '/PIDDIR=\".\"/c\PIDDIR=/var/run' /etc/init.d/nexus
RUN sed -i '/#RUN_AS_USER=/c\RUN_AS_USER=nexus' /etc/init.d/nexus
RUN update-rc.d nexus defaults
EXPOSE 8082
ENTRYPOINT /opt/nexus-2.12.0-01/bin/nexus start && bash
