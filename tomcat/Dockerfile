# tomcat dockerfile
FROM dockeraws_java8
MAINTAINER MikeyB

RUN apt-get update
RUN apt-get install -y wget
WORKDIR /opt/

#install tomcat
RUN wget http://mirror.catn.com/pub/apache/tomcat/tomcat-8/v8.5.8/bin/apache-tomcat-8.5.8.tar.gz
RUN tar zxvf apache-tomcat-8*.tar.gz

#make a tomcat group and user, set it as the owner and give root permission
RUN groupadd tomcat && useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
RUN chown -R tomcat:tomcat apache-tomcat-8*
RUN chmod -R 755 apache-tomcat-8*

RUN echo "export JAVA_HOME=/opt/jdk1.8.0_111/bin/java" >> /etc/profile

# tomcat is now the owner of the directory
RUN chgrp -R tomcat /opt/apache-tomcat-8*

EXPOSE 8083

ENTRYPOINT /opt/apache-tomcat-8*/bin/startup.sh && bash
