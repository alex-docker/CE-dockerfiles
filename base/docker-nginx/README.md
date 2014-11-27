## Nginx Dockerfile


### Base Docker Image

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/dockerfile/nginx/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull dockerfile/nginx`

   (alternatively, you can build an image from Dockerfile: `docker build -t="dockerfile/nginx" github.com/dockerfile/nginx`)


### Usage
```
    docker run -d -p 80:80 clouderg/nginx
```
#### Attach persistent/shared directories
```
    docker run -d -p 80:80 -v `pwd`/sites:/etc/nginx/sites-enabled -v `pwd`/certs:/etc/nginx/certs -v `pwd`/log:/var/log/nginx -v `pwd`/devops:/devops dockerfile/nginx
```
After few seconds, open `http://<host>` to see the welcome page.

### mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/devops"]
