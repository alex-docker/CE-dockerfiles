FROM clouderg/dsubuntu14
MAINTAINER docker@clouderg.com

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -yq install mysql-server-5.5 pwgen && \
  rm -rf /var/lib/apt/lists/*

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

# Add MySQL configuration
RUN rm -rf /etc/mysql/conf.d/*
ADD my.cnf /etc/mysql/my.cnf
ADD my.local.cnf /etc/mysql/conf.d/my.local.cnf
ADD mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf

# Add MySQL scripts
ADD create_mysql_admin_user.sh /usr/local/bin/create_mysql_admin_user.sh
ADD import_sql.sh /usr/local/bin/import_sql.sh
ADD run.sh /usr/local/bin/run.sh
RUN chmod 755 /usr/local/bin/*

# install supervisor config
ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Exposed ENV
ENV MYSQL_USER admin
ENV MYSQL_PASS **Random**

# Replication ENV
ENV REPLICATION_MASTER **False**
ENV REPLICATION_SLAVE **False**
ENV REPLICATION_USER replica
ENV REPLICATION_PASS replica

# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql/conf.d", "/var/lib/mysql", "/var/log/mysql", "/devops"]

EXPOSE 3306

#CMD ["/usr/local/bin/run.sh"]
# exposing ports to master and startup supervisior
CMD ["/usr/bin/supervisord"]
