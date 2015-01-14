FROM clouderg/meanstack
MAINTAINER docker@clouderg.com


run	bash -c "apt-get install -y software-properties-common python-software-properties || true"
run	add-apt-repository ppa:vbernat/haproxy-1.5
run     apt-get update

run	bash -c "apt-get install -y haproxy || true"
run	sed -i 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy && \
	rm -rf /var/lib/apt/lists/*

run	sed -i 's/var\/www/home\/www/' /etc/passwd && \
	( mkdir /home/www;cd /home;chown -R www-data: www )

add     ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
add	haproxy.cfg /etc/haproxy/haproxy.cfg
add	start.bash /haproxy-start

# Define additional metadata for our image.
VOLUME ["/var/log/supervisor", "/etc/supervisor/conf.d", "/data", "/etc/haproxy/", "/home/devops", "/home/www" ]

expose  80 443
cmd     ["/usr/bin/supervisord", "-n"]
