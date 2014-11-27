REF : http://stackoverflow.com/questions/24673357/creating-a-default-database-in-mysql-using-dockerfile

docker build -t clouderg/dbserver .

#to run :
#dockerID=docker run -d -p 3307:3306 clouderg/mysql
#mysqlPasswd=docker logs $dockerID
#mysqlIP=docker inspect $dockerID
#mysql -uadmin -p$mysqlPasswd -h$mysqlIP -P3307
