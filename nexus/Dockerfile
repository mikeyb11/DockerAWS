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

RUN mkdir -p /opt/sonatype-nexus /opt/sonatype-work
RUN wget -O /tmp/nexus-latest-bundle.tar.gz http://download.sonatype.com/nexus/oss/nexus-2.13.0-01-bundle.tar.gz
RUN tar xzvf /tmp/nexus-latest-bundle.tar.gz -C /opt/sonatype-nexus --strip-components=1
RUN useradd --user-group --system --home-dir /opt/sonatype-nexus nexus

#ADD nexus.xml /opt/sonatype-work/nexus/conf/nexus.xml

RUN chown -R nexus:nexus /opt/sonatype-work /opt/sonatype-nexus

ENV NEXUS_WEBAPP_CONTEXT_PATH /nexus
RUN echo "#!/bin/bash" > /opt/start-nexus.sh
RUN echo "su -c \"/opt/sonatype-nexus/bin/nexus console\" - nexus" >> /opt/start-nexus.sh
RUN chmod +x /opt/start-nexus.sh

CMD ["/opt/start-nexus.sh"]
EXPOSE 8082

#ENTRYPOINT /opt/nexus-2.13.0-01/bin/nexus start && bash
