[ ! -f ./precise-core-amd64.tar.gz ] && wget http://cdimage.ubuntu.com/ubuntu-core/precise/daily/current/precise-core-amd64.tar.gz
docker build -t clouderg/ubuntu12 .
