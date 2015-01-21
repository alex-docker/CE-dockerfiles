FROM clouderg/meanstack
MAINTAINER docker@clouderg.com


run	bash -c "apt-get install -y software-properties-common python-software-properties || true"
run	add-apt-repository ppa:vbernat/haproxy-1.5
run     apt-get update

run	bash -c "apt-get install -y haproxy git || true"
run	sed -i 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy && \
	rm -rf /var/lib/apt/lists/*

run	sed -i 's/var\/www/home\/www/' /etc/passwd
run	chsh -s /bin/bash www-data
run	( cd /home;git clone https://github.com/cobjet-worker/www.git;chown -R www-data: www )
run	( cd /home/www;git clone https://github.com/cobjet-worker/nodeapp.git;chown -R www-data: nodeapp )
run	( cd /usr/local;\rm -rf bin;git clone https://github.com/cobjet-worker/bin.git;chown -R root: bin;chmod +x /usr/local/bin/*)

add     ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
add	haproxy.cfg /etc/haproxy/haproxy.cfg


# Define additional metadata for our image.
VOLUME ["/var/log/supervisor", "/etc/supervisor/conf.d", "/usr/local", "/data", "/etc/haproxy/", "/home/devops", "/home/www" ]

expose  80 443
cmd     ["/usr/bin/supervisord", "-n"]
