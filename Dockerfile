FROM zabbix/zabbix-server-mysql:centos-latest

USER root

RUN curl https://packages.microsoft.com/config/rhel/8/prod.repo > /etc/yum.repos.d/mssql-release.repo && \
    ACCEPT_EULA=Y yum -y install libaio libnsl.x86_64 msodbcsql17 && \
    rpm -ivh https://download.oracle.com/otn_software/linux/instantclient/19800/oracle-instantclient19.8-basic-19.8.0.0.0-1.x86_64.rpm && \
    rpm -ivh https://download.oracle.com/otn_software/linux/instantclient/19800/oracle-instantclient19.8-odbc-19.8.0.0.0-1.x86_64.rpm && \
    sed -i 's,^\(MinProtocol[ ]*=\).*,\1'TLSv1.0',g' /etc/crypto-policies/back-ends/opensslcnf.config && \
    sed -i 's,^\(CipherString[ ]*=\).*,\1'DEFAULT@SECLEVEL=1',g' /etc/crypto-policies/back-ends/opensslcnf.config

USER 1997
