# zabbix dockerfile
FROM ubuntu
USER root
MAINTAINER MikeyB

RUN apt-get update
RUN apt-get install -y wget

# installing apache
RUN apt-get install -y apache2

# getting the download
RUN wget http://repo.zabbix.com/zabbix/3.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.0-1+trusty_all.deb

RUN dpkg -i zabbix-release_3.0-1+trusty_all.deb
RUN apt-get install -y zabbix-agent

RUN sed -i '/Server=127/c\Server=52.212.188.209' /etc/zabbix/zabbix_agentd.conf

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php7.0-mysql php7.0-curl php7.0-json php7.0-cgi php7.0 libaoache2-mod-php7.0

RUN sed -i '/date.timezone =/c\date.timezone = Europe/London' /etc/php/7.0/apache2/php.ini

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y zabbix-server-mysql zabbix-frontend-php

RUN service mysql start\
&& mysql -u root -e "create user 'zabbix';"\
&& mysql -u root -e "create database zabbixdb;"\
&& mysql -u root -e "grant all privileges on zabbixdb.* to 'zabbix';"\
&& mysql -u root -e "flush privileges;"

WORKDIR /usr/share/doc/zabbix-server-mysql

RUN service mysql start && zcat create.sql.gz | mysql -u root zabbixdb
RUN sed -i '/DBHost=/c\DBHost=localhost' /etc/zabbix/zabbix_server.conf
RUN sed -i '/DBName=zabbix/c\DBName=zabbixdb' /etc/zabbix/zabbix_server.conf

EXPOSE 80:80

ENTRYPOINT service apache2 restart && service zabbix-server restart && service zabbix-agent restart && bash
