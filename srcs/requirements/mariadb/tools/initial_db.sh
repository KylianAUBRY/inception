#!/bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$WP_ADMIN_PASSWORD';
CREATE DATABASE $WP_TITLE CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$WP_USER_LOGIN'@'%' IDENTIFIED by '$WP_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $WP_TITLE.* TO '$WP_USER_LOGIN'@'%';
GRANT SELECT ON mysql.* TO '$WP_USER_LOGIN'@'%';
FLUSH PRIVILEGES;
EOF

mysqld --defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf
