#!/bin/bash

if [ $META_NET_REMOTESEGMENTS ]; then
	for IPNetwork in $( echo $META_NET_REMOTESEGMENTS | tr "," "\n" ); do
	  route add -net $IPNetwork netmask $META_NET_GATEWAY gw $( echo $IPNetwork | sed -e 's/\.0$/.254/g' )
	done
fi

/usr/local/bin/confd -onetime
/usr/bin/supervisord