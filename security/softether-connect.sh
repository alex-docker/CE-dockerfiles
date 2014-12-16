#!/bin/bash
# This script used for automatically connecting to SoftEther VPN Server,
# Before running, you should create accounts in SoftEther client.
#
# Warning: root permission needed to run this script.
# ------------------------------------------------------
# Contacts:
# zungmou@gmail.com

# Check root permission
if [ `whoami` != "root" ]; then
	echo "Please run the shell with root user."
	return 0
fi

# Get VPN server IP address
case $1 in
	"start" | "stop")
	ip=`./vpncmd /client localhost /cmd accountget $2|awk 'BEGIN {FS="|"} {print $2}'|grep '^[0-9]\{1,3\}\.'|head -n 1`
;;
esac

route_action()
{
	case $1 in
		'del')
		via='';
	;;
		'add')
		via='via 10.211.254.254'
	;;
	esac
	
	case $1 in
		"del" | "add")
		# Google
		ip route $1 173.194.0.0/16 $via
		ip route $1 74.125.0.0/16 $via

		# VPNGate
		ip route $1 130.158.0.0/16 $via

		# OpenDNS
		ip route $1 208.67.216.0/21 $via

		# Digital Ocean, Inc.
		ip route $1 107.170.0.0/16 $via

		# ARIN
		ip route $1 199.71.0.0/24 $via
		ip route $1 199.212.0.0/24 $via

		# Twitter
		ip route $1 199.16.156.0/22 $via
		ip route $1 199.96.56.0/21 $via

		# Ripe
		ip route $1 31.0.0.0/8 $via

		# LVLT
		ip route $1 8.0.0.0/8 $via
		
		# Amazon
		ip route $1 54.240.192.0/18 $via

	;;
	esac
}

case $1 in
	"start")
	# Connect to VPN server
	./vpncmd /client localhost /cmd accountconnect $2

	# Request VPN ip address
	# dhclient vpn_softether
	
	# Get default gateway
	gw=`ip route show | grep '^default' | sed -e 's/default via \([^ ]*\).*/\1/'`

	# Save default gateway
	echo $gw >> /tmp/softether_gw 

	# Add VPN server ip address route to default gateway
	ip route add $ip/32 via $gw

	route_action "add"
;;
	"stop")
	# Disconnect to VPN server
	./vpncmd /client localhost /cmd accountdisconnect $2
	
	# Delete VPN server ip address route
	ip route del $ip/32

	route_action "del"
;;
	"show")
	./vpncmd /client localhost /cmd accountlist
	exit 1
;;
	"delete")
	./vpncmd /client localhost /cmd accountdisconnect $2	
	./vpncmd /client localhost /cmd accountdelete $2
;;
	"add")
	./vpncmd /client localhost /cmd accountcreate $2
;;
	"set")
	./vpncmd /client localhost /cmd accountset $2
;;
	"route")
	route_action "del"
	route_action "add"
	exit 1
;;
	*)
	cat << EOF
Usage:
  start - Start the vpn account.
        - $ ./vpn start [AccountName]

  stop  - Stop the vpn account.
        - $ ./vpn stop [AccountName]

  show  - Show the current SoftEther client's account list.
	- $ ./vpn show
EOF
;;
esac

