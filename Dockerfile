FROM zabbix/zabbix-server-mysql:centos-latest

USER root

RUN apk add --no-cache curl nmap
