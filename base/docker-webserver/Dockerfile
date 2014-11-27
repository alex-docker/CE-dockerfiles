FROM clouderg/dsubuntu14
MAINTAINER docker@clouderg.com

run     apt-get update
run     bash -c "apt-get install supervisor nginx -y || true"

rUN 	sed -ri 's!\berror_log\s+\S*\b!error_log stderr!' /etc/nginx/nginx.conf && echo '\n# prevent backgrounding (for Docker)\ndaemon off;' >> /etc/nginx/nginx.conf
run     mkdir -p /var/log/supervisor
run     locale-gen en_US en_US.UTF-8

add     ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

expose  80 443
cmd     ["/usr/bin/supervisord", "-n"]
