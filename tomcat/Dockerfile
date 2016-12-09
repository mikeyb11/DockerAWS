# tomcat dockerfile
FROM dockeraws_java8
MAINTAINER MikeyB

RUN apt-get install -y wget

WORKDIR /opt/

RUN groupadd tomcat
RUN useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

RUN wget http://mirrors.ukfast.co.uk/sites/ftp.apache.org/tomcat/tomcat-8/v8.5.8/src/apache-tomcat-8.5.8-src.tar.gz

RUN tar -xzvf apache-tomcat-8*tar.gz
# renames to tomcat
#RUN mv apache-tomcat-8* tomcat

#change ownership to tomcat user
RUN chown -hR tomcat:tomcat apache-tomcat-8*
# make all files in bin executable
RUN chmod +x /opt/apache-tomcat-8*/bin/*

WORKDIR /opt/apache-tomcat-8*

# set the java home
#RUN sed -i '/Environment=JAVA_HOME=/c\Environment=JAVA_HOME=/opt/jdk1.8.0_111/bin/java' #/etc/systemd/system/tomcat.service

# reset the systemd
RUN service systemctl daemon-reload

# start the tomcat service 
RUN service systemctl start tomcat

# set the port
RUN ufw allow 8083

EXPOSE 8083

# run service
ENTRYPOINT service systemctl enable tomcat && bash
