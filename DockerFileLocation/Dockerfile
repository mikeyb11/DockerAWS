# docker file to run and build programs
FROM ubuntu
MAINTAINER MikeyB

RUN apt-get update -y
RUN apt-get install -y git
RUN apt-get install -y wget

RUN apt-get install -f

WORKDIR /home/ubuntu

RUN git clone https://github.com/mikeyb11/DockerAWS.git

WORKDIR /opt/

RUN  wget --no-cookies \
     --no-check-certificate \
     --header "Cookie: oraclelicense=accept-securebackup-cookie" \
     "http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.tar.gz"

RUN tar zxvf jdk-7u55-linux-x64.tar.gz

RUN update-alternatives --install /usr/bin/java java /opt/jdk1.7.0_55/bin/java 100
RUN update-alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_55/bin/javac 100

RUN wget http://mirror.fibergrid.in/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz

RUN tar zxvf apache-maven-3.3.9-bin.tar.gz

RUN update-alternatives --install /usr/bin/mvn mvn /opt/apache-maven-3.3.9/bin/mvn 100

RUN java -version
RUN mvn -version
