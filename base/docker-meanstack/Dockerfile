FROM clouderg/mongodb
MAINTAINER docker@clouderg.com


run     apt-get update
run	bash -c "apt-get install -y curl || true"

run	curl -sL https://deb.nodesource.com/setup | bash -
run	bash -c "apt-get install -y python-software-properties python g++ make build-essential || true"
run	bash -c "apt-get install -y nodejs || true"

add     ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

expose  27017 22
cmd     ["/usr/bin/supervisord", "-n"]
