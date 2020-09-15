FROM zabbix/zabbix-server-mysql:centos-latest

USER root

RUN yum -y install libaio libnsl.x86_64 && \
    rpm -ivh https://download.oracle.com/otn_software/linux/instantclient/19800/oracle-instantclient19.8-basic-19.8.0.0.0-1.x86_64.rpm && \
    rpm -ivh https://download.oracle.com/otn_software/linux/instantclient/19800/oracle-instantclient19.8-odbc-19.8.0.0.0-1.x86_64.rpm

USER 1997
