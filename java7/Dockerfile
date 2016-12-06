# java dockerfile
FROM ubuntu
MAINTAINER MikeyB

RUN apt-get update -y
RUN apt-get install -y wget

RUN apt-get install -f

WORKDIR /opt/

RUN  wget --no-cookies \
     --no-check-certificate \
     --header "Cookie: oraclelicense=accept-securebackup-cookie" \
     "http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.tar.gz"

RUN tar zxvf jdk-7u55-linux-x64.tar.gz

RUN update-alternatives --install /usr/bin/java java /opt/jdk1.7.0_55/bin/java 100
RUN update-alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_55/bin/javac 100

RUN java -version