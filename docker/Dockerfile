FROM php:7.2.11-apache

ENV APACHE_DOCUMENT_ROOT /var/www/public

RUN docker-php-ext-install pdo pdo_mysql

RUN pecl install -o -f redis \
  &&  rm -rf /tmp/pear \
  &&  docker-php-ext-enable redis

WORKDIR /var/www