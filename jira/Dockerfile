# jira dockerfile
FROM ubuntu
MAINTAINER MikeyB

RUN apt-get update
WORKDIR /opt/
RUN apt-get install -y wget

RUN apt-get install -f

WORKDIR /opt/

#RUN  wget --no-cookies \
#     --no-check-certificate \
#     --header "Cookie: oraclelicense=accept-securebackup-cookie" \
#     "http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.tar.gz"

#RUN tar zxvf jdk-7u55-linux-x64.tar.gz

#RUN update-alternatives --install /usr/bin/java java /opt/jdk1.7.0_55/bin/java 100
#RUN update-alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_55/bin/javac 100

RUN wget "https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-7.2.3-x64.bin"
RUN chmod a+x atlassian-jira-software-7.2.3-x64.bin
COPY response.varfile /opt/

RUN ./atlassian-jira-software-7.2.3-x64.bin -q -varfile ./response.varfile
EXPOSE 8081
ENTRYPOINT service jira start && bash
