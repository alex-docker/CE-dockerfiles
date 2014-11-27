changes to default setenv.sh
===========================

wget http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-3.4.3.tar.gz -O stash.tgz

### extract then update stash/bin/setenv.sh for IPv4 and stash-home

STASH-home=/opt/stash-home
JAVA_OPTS= $JAVA_OPTS -Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses

### tar up the new stash as stash.tgz before running build.sh
