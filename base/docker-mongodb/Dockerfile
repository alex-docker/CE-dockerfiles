FROM clouderg/dsubuntu14
MAINTAINER docker@clouderg.com

run     apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
run     bash -c "echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/10gen.list"

run     apt-get update
run     bash -c "apt-get install openssh-server supervisor mongodb-10gen -y || true"

run     mkdir -p /data/db
run     mkdir -p /var/run/sshd
run     mkdir -p /var/log/supervisor
run     locale-gen en_US en_US.UTF-8

add     ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
add	./90-devops /etc/sudoers.d/90-devops
add	./devops-user /usr/local/bin/devops-user
run	chmod +x /usr/local/bin/devops-user
run	chmod 440 /etc/sudoers.d/90-devops
run	/usr/local/bin/devops-user

# Define additional metadata for our image.
VOLUME ["/var/log/supervisor", "/etc/supervisor/conf.d", "/home/devops"]

expose  27017 22
cmd     ["/usr/bin/supervisord", "-n"]
