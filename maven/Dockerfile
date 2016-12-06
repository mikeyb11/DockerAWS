# maven dockerfile
FROM ubuntu
MAINTAINER MikeyB

RUN apt-get update -y
RUN apt-get install -y wget
RUN apt-get install -f

WORKDIR /opt/

RUN wget "http://www.mirrorservice.org/sites/ftp.apache.org/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz"

RUN tar zxvf apache-maven-3.3.9-bin.tar.gz

RUN update-alternatives --install /usr/bin/mvn mvn /opt/apache-maven-3.3.9/bin/mvn 100

RUN mvn -version
