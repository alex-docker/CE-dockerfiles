FROM clouderg/dsubuntu14
MAINTAINER docker@clouderg.com

# Installing Supervisor
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
RUN apt-get install -y software-properties-common

# Install java
RUN yes | add-apt-repository ppa:webupd8team/java
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get update && apt-get install -y git curl oracle-java7-installer


ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Define additional metadata for our image.
VOLUME /var/lib/docker

# exposing ports to master and startup supervisior
CMD ["/usr/bin/supervisord"]
