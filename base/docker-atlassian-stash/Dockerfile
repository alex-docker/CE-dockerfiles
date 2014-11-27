FROM clouderg/java7
MAINTAINER docker@clouderg.com

# Installing Supervisor
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

# Install stash
ADD ./stash.tgz /opt
RUN mkdir /opt/stash-home
RUN ln -s /opt/atlassian-stash* /opt/stash
COPY ./setenv.sh /opt/stash/bin/setenv.sh

ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Define additional metadata for our image.
VOLUME ["/opt/stash-home"]

EXPOSE 7990
# exposing ports to master and startup supervisior
CMD ["/usr/bin/supervisord"]
