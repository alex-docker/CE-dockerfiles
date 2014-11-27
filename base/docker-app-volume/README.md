REF: http://www.tech-d.net/2013/12/16/persistent-volumes-with-docker-container-as-volume-pattern/

Dockerfile:
```
# Dockerfile
FROM busybox
MAINTAINER docker@clouderg.com

VOLUME /app
CMD /bin/sh
```

to create a volume :
```
docker build -t clouderg/app .
```

to mount a volume : (during instance run only)
```
docker run -d -volumes-from app clouderg/app-server
```
