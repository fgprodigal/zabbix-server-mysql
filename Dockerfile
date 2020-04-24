FROM zabbix/zabbix-server-mysql:latest

USER root

RUN apk add --no-cache curl