[ ! -f ./ubuntu-core-14.04-core-amd64.tar.gz ] && wget http://cdimage.ubuntu.com/ubuntu-core/releases/14.04/release/ubuntu-core-14.04-core-amd64.tar.gz
docker build -t clouderg/ubuntu14 .
