#!/bin/bash
pwd=`dirname $0`

read -e -p "Target directory: " -i "/var/www" dir
dir=${dir:-"/var/www/wordpress"}

read -e -p "Database: " -i "wordpress" db
db=${db:-"wordpress"}

if [ ! -d "$dir" ]; then
	sudo mkdir -p $dir
fi

sed -i 's/2M/10M/g' /etc/php5/fpm/php.ini
service php5-fpm restart
service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS $db;"

chown -R www-data:www-data $dir
chmod -R 775 $dir

#service nginx restart

echo ""
echo "Install complete!"
echo "Please restart your session."
echo ""

exit 0
