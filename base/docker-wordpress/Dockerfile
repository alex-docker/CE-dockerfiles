#
# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM clouderg/dsubuntu14

# Install Nginx.
RUN \
  apt-get install -y software-properties-common

RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx \
        mysql-server \
        php5-curl \
        php5-fpm \
        php5-gd \
        php5-mysql \
        wget \
        unzip  && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx /var/log/nginx && \
  rm -f /etc/nginx/sites-enabled/default

COPY \
  ./wordpress.conf etc/nginx/sites-enabled/

COPY \
  ./install.sh /root/

ADD \
  ./wordpress.tgz /var/www/

RUN \
  chmod +x /root/install.sh && \
  /root/install.sh
  


# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/devops"]

# Define working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80
EXPOSE 443

# exposing ports to master and startup supervisior
CMD ["/usr/bin/supervisord"]
