# docker file to run and build programs
FROM ubuntu:16.04
MAINTAINER MikeyB

CMD /bin/bash

RUN apt-get update -y
RUN apt-get install -y git

#RUN git clone https://github.com/mikeyb11/DockerAWS.git

#RUN sudo docker pull java:7


RUN sed -i "$/^/HELLO\n/" /etc/environment
