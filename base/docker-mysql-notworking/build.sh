docker build -t clouderg/mysql .

#To run the image and bind to port 3306:
#
        #docker run -d -p 3306:3306 clouderg/mysql
#
#The first time that you run your container, a new user `admin` with all privileges
#will be created in MySQL with a random password. To get the password, check the logs
#of the container by running:
#
        #docker logs <CONTAINER_ID>
#
# Add VOLUMEs to allow backup of config and databases
#VOLUME  ["/etc/mysql/conf.d", "/var/lib/mysql", "/var/log/mysql", "/devops"]
