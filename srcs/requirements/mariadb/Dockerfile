FROM debian:bullseye

RUN apt-get update && apt-get install mariadb-server mariadb-client sysvinit-utils -y

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools /var/www/

RUN chmod +x /var/www/initial_db.sh

ENTRYPOINT ["/var/www/initial_db.sh"]
