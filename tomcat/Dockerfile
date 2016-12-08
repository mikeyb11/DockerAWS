# tomcat dockerfile
FROM dockeraws_java8
MAINTAINER MikeyB

RUN apt-get install -y wget

WORKDIR /opt/

RUN groupadd tomcat
RUN useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

RUN wget http://mirrors.ukfast.co.uk/sites/ftp.apache.org/tomcat/tomcat-8/v8.5.8/src/apache-tomcat-8.5.8-src.tar.gz

RUN tar -xzvf apache-tomcat-8*tar.gz

WORKDIR /opt/tomcat

# gives tomcat owner ship
RUN chgrp -R tomcat /opt/tomcat

# give tomcat group read access to conf file, and excute access to dir itself
#RUN chmod -R g+r conf
#RUN chmod g+x conf

# make tomcat owner of 
#RUN chown -R tomcat webapps/ work/ temp/ logs/

# set the java home
#RUN sed -i '/Environment=JAVA_HOME=/c\Environment=JAVA_HOME=/opt/jdk1.8.0_111/bin/java' #/etc/systemd/system/tomcat.service

# reset the systemd
#RUN systemctl daemon-reload

# start the tomcat service 
RUN systemctl start tomcat

# set the port
RUN ufw allow 8083

EXPOSE 8083

# run service
ENTRYPOINT systemctl enable tomcat && bash