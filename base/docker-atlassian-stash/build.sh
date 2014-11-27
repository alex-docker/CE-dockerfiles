[ ! -f ./stash.tgz ] && wget http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-3.4.3.tar.gz -O stash.tgz
docker build -t clouderg/atlassian-stash .
