#!/bin/bash

set -e

/sbin/ifconfig tap_soft 172.31.253.1 netmask 255.255.255.128
/usr/sbin/dhcpd -cf /etc/dhcpd.conf -d
