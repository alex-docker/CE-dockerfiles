FROM clouderg/dubuntu12
MAINTAINER docker@clouderg.com

# Installing Supervisor
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Define additional metadata for our image.
VOLUME ["/var/log/supervisor", "/etc/supervisor/conf.d"]

# exposing ports to master and startup supervisior
CMD ["/usr/bin/supervisord"]
