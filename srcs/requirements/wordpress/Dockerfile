FROM debian:bullseye

RUN apt-get update && apt-get -y install php7.4 php-mysqli php-fpm wget sendmail

EXPOSE 9000

RUN mkdir -p /run/php/ /var/www/html/wordpress/

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d
COPY ./tools /var/www

RUN chmod +x /var/www/wordpress_start.sh

ENTRYPOINT [ "/var/www/wordpress_start.sh" ]

CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]
