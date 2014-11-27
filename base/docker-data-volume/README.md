REF: http://www.tech-d.net/2013/12/16/persistent-volumes-with-docker-container-as-volume-pattern/

Dockerfile:
```
# Dockerfile
FROM busybox
VOLUME /var/lib/mysql
CMD /bin/sh
```

to create a volume :
```
docker build -t clouderg/data_mysql .
```

to mount a volume : (during instance run only)
```
docker run -d -volumes-from data_mysql clouderg/mysql
```
