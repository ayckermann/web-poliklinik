FROM php:7.2-apache
# FROM arm64v8/php:7.2-apache

RUN a2enmod ssl && a2enmod rewrite
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install mysqli
RUN mkdir -p /etc/apache2/ssl

# COPY ./php/php.ini /usr/local/etc/php/php.ini-development

COPY ./ssl/*.pem /etc/apache2/ssl/
COPY ./apache/000-default.conf /etc/apache2/sites-available/000-default.conf

COPY . /var/www/html

EXPOSE 8080
EXPOSE 443