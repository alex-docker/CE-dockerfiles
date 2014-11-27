#!/bin/bash

DB="test"

if [[ $# -eq 0 ]]; then
	echo "to create database : $0 <db_name>"
else
	DB=$1
fi

/usr/bin/mysqld_safe > /dev/null 2>&1 &

echo "=> Creating database $DB"
RET=1
while [[ RET -ne 0 ]]; do
	sleep 5
	mysql -uroot -e "CREATE DATABASE $DB"
	RET=$?
done

mysqladmin -uroot shutdown

echo "=> Done!"
