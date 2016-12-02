# docker file to run and build programs
FROM ubuntu
MAINTAINER MikeyB

#CMD /bin/bash

RUN apt-get update -y
RUN apt-get install -y git
RUN apt-get install -y wget

RUN apt-get install -f

#RUN git clone https://github.com/mikeyb11/DockerAWS.git

#WORKDIR /home/ubuntu/

#RUN  wget --no-cookies \
 #    --no-check-certificate \
 #   --header "Cookie: oraclelicense=accept-securebackup-cookie" \
 #    "http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.tar.gz"

#RUN tar zxvf jdk-7u55-linux-x64.tar.gz

#RUN update-alternatives --install /usr/bin/java java /opt/jdk1.7.0_55/bin/java 100
#RUN update-alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_55/bin/javac 100

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java7-installer && \
    apt-get clean

RUN java -version
