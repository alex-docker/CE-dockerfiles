
# Worker container

- /usr/local/bin/rootcron : jobs running every sec

VOLUME ["/var/log/supervisor", "/etc/supervisor/conf.d", "/usr/local", "/data", "/etc/haproxy/", "/home/devops", "/home/www" ]
