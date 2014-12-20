FROM clouderg/dubuntu14

RUN apt-get update && apt-get install -y -q gcc binutils make supervisor isc-dhcp-server curl

ENV softether_url http://www.softether-download.com/files/softether/v4.11-9506-beta-2014.10.22-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.11-9506-beta-2014.10.22-linux-x64-64bit.tar.gz

WORKDIR /opt

RUN curl ${softether_url} | tar zxv

RUN cd /opt/vpnserver && make i_read_and_agree_the_license_agreement

ADD resources/dhcpd.conf /etc/dhcpd.conf

ADD resources/supervisord.conf /etc/supervisor/supervisord.conf
ADD scripts/init.sh /opt/init.sh

VOLUME /usr/local/vpnserver/

ENV PATH /opt/vpnserver/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ADD scripts/admin.sh /opt/vpnserver/vpnadmin
RUN chmod +x /opt/vpnserver/vpnadmin
RUN chmod +x /opt/init.sh

EXPOSE 443/tcp 992/tcp 1194/tcp 1194/udp 5555/tcp

CMD ["/opt/init.sh"]
