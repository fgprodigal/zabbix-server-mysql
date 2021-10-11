FROM zabbix/zabbix-server-mysql:ubuntu-trunk

USER root

RUN apt update && apt install -y curl gnupg libaio-dev unzip && \
  curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
  curl https://packages.microsoft.com/config/ubuntu/21.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
  apt update && \
  ACCEPT_EULA=Y apt-get install -y msodbcsql17 && \
  wget https://download.oracle.com/otn_software/linux/instantclient/1912000/instantclient-basic-linux.x64-19.12.0.0.0dbru.zip && \
  wget https://download.oracle.com/otn_software/linux/instantclient/1912000/instantclient-odbc-linux.x64-19.12.0.0.0dbru.zip && \
  unzip instantclient-basic-linux.x64-19.12.0.0.0dbru.zip -d /opt/oracle/ && \
  unzip instantclient-odbc-linux.x64-19.12.0.0.0dbru.zip -d /opt/oracle/ && \
  rm -rf instantclient-*.zip

USER 1997

ENV PATH="${PATH}:/opt/oracle/instantclient_19_12"
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/opt/oracle/instantclient_19_12"
