FROM clouderg/dubuntu14

RUN apt-get update && apt-get install -y curl nginx

# log to stderr
#RUN sed -ri 's!\berror_log\s+\S*\b!error_log stderr!' /etc/nginx/nginx.conf && echo '\n# prevent backgrounding (for Docker)\ndaemon off;' >> /etc/nginx/nginx.conf

EXPOSE 80
EXPOSE 443
CMD [ "nginx" ]
