#/bin/bash

if [ ! -d /var/lib/mysql/mysql ]
	then 
		echo 'leerer ordner'
		cp -r /var/lib/mysqltmp/* /var/lib/mysql
fi 

cp /var/lib/mysql/mysqld.cnf /etc/mysql/mysql.conf.d/
service mysql start

/etc/init.d/mysql start
mysql -u root -e "CREATE DATABASE GebKalender"
#mysql -u root -e "USE GebKalender;CREATE TABLE persons(id INTEGER AUTO_INCREMENT ,name varchar(50) ,gebTag INTEGER ,gebMonat INTEGER ,gebJahr INTEGER , PRIMARY KEY (id))" || echo " "


mysql -u root -e "create user 'backnd'@'%' identified by 'backend';grant all privileges on *.* to 'backnd'@'%' with grant option; flush privileges"

service mysql restart
