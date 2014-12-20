FROM clouderg/dubuntu14
MAINTAINER docker@clouderg.com


# -----------------------------------------------------------------------------
# Docker environment

ENV DEBIAN_FRONTEND noninteractive

ENV SOFTETHER_VERSION {{getv "/meta/softether/version"}}
ENV CONFD_VERSION {{getv "/meta/confd/version"}}


# -----------------------------------------------------------------------------
# Package deployment

RUN mkdir /root/tmp
WORKDIR /root/tmp

RUN \
  export LANGUAGE=en_US.UTF-8 && \
  export LANG=en_US.UTF-8 && \
  export LC_ALL=en_US.UTF-8 && \
  locale-gen en_US.UTF-8 && \
  dpkg-reconfigure locales

RUN \
  apt-get update && \
  apt-get install -y bash curl lftp wget git htop mc man zip unzip vim nano ltrace strace multitail openssh-server supervisor monit nmap socat dnsutils traceroute gnupg

RUN \
  apt-get update && \
  apt-get install -y build-essential && \
  apt-get install -y python

RUN \
  echo "deb http://apt.newrelic.com/debian/ newrelic non-free" >> /etc/apt/sources.list.d/newrelic.list && \
  wget -O - https://download.newrelic.com/548C16BF.gpg | apt-key add - && \
  apt-get update && \
  apt-get install -y newrelic-sysmond newrelic-daemon

RUN \
  wget -O - https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python && \
  pip install newrelic-plugin-agent && \
  cp /opt/newrelic-plugin-agent/newrelic-plugin-agent.cfg /etc/newrelic/ && \
  cp /opt/newrelic-plugin-agent/newrelic-plugin-agent.deb /etc/init.d/newrelic-plugin-agent && \
  chmod 755 /etc/init.d/newrelic-plugin-agent && \
  mkdir -p /var/run/newrelic

COPY src/softether-vpnclient-v4.12-9514-beta-2014.11.17-linux-x64-64bit.tar.gz /root/tmp/softether-vpnclient-linux-x86-64bit.tar.gz

RUN \
  tar -xzvf softether-vpnclient-linux-x86-64bit.tar.gz && \
  cd vpnclient && \
  make i_read_and_agree_the_license_agreement && \
  cd .. && \
  mv vpnclient /usr/local && \
  cd /usr/local/vpnclient/ && \
  chmod 600 * && \
  chmod 700 vpnclient && \
  chmod 700 vpncmd && \
  rm -f /root/tmp/softether-vpnclient-linux-x86-64bit.tar.gz

COPY settings/confd/ /etc/confd/
COPY settings/init-vpnserver.sh /etc/init.d/vpnserver

COPY src/softether-vpnserver-v4.12-9514-beta-2014.11.17-linux-x64-64bit.tar.gz /root/tmp/softether-vpnserver-linux-x86-64bit.tar.gz

RUN \
  tar -xzvf softether-vpnserver-linux-x86-64bit.tar.gz && \
  cd vpnserver && \
  make i_read_and_agree_the_license_agreement && \
  cd .. && \
  mv vpnserver /usr/local && \
  cd /usr/local/vpnserver/ && \
  chmod 600 * && \
  chmod 700 vpnserver && \
  chmod 700 vpncmd && \
  mkdir -p mkdir /var/lock/subsys && \
  chmod 755 /etc/init.d/vpnserver && \
  update-rc.d vpnserver defaults && \
  rm -f /root/tmp/softether-vpnserver-linux-x86-64bit.tar.gz

RUN apt-get clean -qq


# -----------------------------------------------------------------------------
# System configuration

RUN echo 'root:{{getv "/meta/node/admin/defaultpasswd"}}' | chpasswd

RUN \
  ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && \
  echo "Etc/UTC" > /etc/timezone && \
  dpkg-reconfigure -f noninteractive tzdata

RUN \
  nrsysmond-config --set license_key=81f560438e44844d6038f547ae35b5aacf9bd292 && \
  cp /etc/newrelic/newrelic.cfg.template /etc/newrelic/newrelic.cfg && \
  sed -i -e 's/REPLACE_WITH_REAL_KEY/81f560438e44844d6038f547ae35b5aacf9bd292/g' /etc/newrelic/newrelic-plugin-agent.cfg

RUN \
  mkdir /var/run/sshd && \
  sed -i "s/UsePAM.*/UsePAM yes/g"                   /etc/ssh/sshd_config && \
  sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config

RUN \
  touch /var/log/syslog /var/log/kern.log /var/log/debug /var/log/mail.log /var/log/mail.err && \
  chown syslog:adm /var/log/syslog /var/log/kern.log /var/log/debug /var/log/mail.log /var/log/mail.err && \
  chmod 640 /var/log/syslog /var/log/kern.log /var/log/debug /var/log/mail.log /var/log/mail.err && \
  sed -i 's/^[#\t\s]*\(\*\.=notice;\*\.=warn\).*xconsole$/\t\1\t\-\/var\/log\/syslog/' /etc/rsyslog.d/50-default.conf

# -----------------------------------------------------------------------------
# Shell environment configuration

COPY settings/.profile             /root/
COPY settings/.profile_preferences /root/
COPY settings/ssh/                 /root/.ssh/
COPY settings/scripts/             /root/scripts/

RUN chmod u+x /root/scripts/*.sh


# -----------------------------------------------------------------------------
# Container execution

WORKDIR /root
EXPOSE 22 2812 9001 443 992 1194 5555

CMD ["/root/scripts/init.sh"]
