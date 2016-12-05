FROM ubuntu:16.04
USER root
MAINTAINER MikeyB

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y default-jre
RUN apt-get install -y default-jdk

RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c 'echo deb https://pkg.jenkins.io/debian-stable/binary/jenkins_2.7.4_all.deb/ > /etc/apt/sources.list.d/jenkins.list'

RUN apt-get update
RUN apt-get install -y jenkins
RUN apt-get update

EXPOSE 8080
ENTRYPOINT service jenkins start && bash
