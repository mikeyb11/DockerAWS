# jenkins dockerfile
FROM ubuntu
MAINTAINER MikeyB

RUN apt-get update
RUN apt-get install -y wget

WORKDIR /opt/

RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

RUN apt-get update
RUN apt-get install -y jenkins
RUN apt-get update

EXPOSE 8080
ENTRYPOINT service jenkins start && bash
