# jenkins dockerfile
FROM ubuntu:16.04
MAINTAINER MikeyB

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y wget

RUN apt-get install -f

#WORKDIR /opt/

#RUN  wget --no-cookies \
#     --no-check-certificate \
#     --header "Cookie: oraclelicense=accept-securebackup-cookie" \
#     "http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.tar.gz"

#RUN tar zxvf jdk-7u55-linux-x64.tar.gz

#RUN update-alternatives --install /usr/bin/java java /opt/jdk1.7.0_55/bin/java 100
#RUN update-alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_55/bin/javac 100

RUN apt-get install -y default-jre
RUN apt-get install -y default-jdk

RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c 'echo deb https://pkg.jenkins.io/debian-stable/binary/jenkins_2.7.4_all.deb/ > /etc/apt/sources.list.d/jenkins.list'

RUN apt-get update
RUN apt-get install -y jenkins
RUN apt-get update

EXPOSE 8080
ENTRYPOINT service jenkins start && bash
