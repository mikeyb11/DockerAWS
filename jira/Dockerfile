# jira dockerfile
FROM ubuntu
MAINTAINER MikeyB

RUN apt-get update
WORKDIR /opt/
RUN apt-get install -y wget

WORKDIR /opt/

RUN wget "https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-7.2.3-x64.bin"
RUN chmod a+x atlassian-jira-software-7.2.3-x64.bin
COPY response.varfile /opt/

RUN ./atlassian-jira-software-7.2.3-x64.bin -q -varfile ./response.varfile
EXPOSE 8081
ENTRYPOINT service jira start && bash
