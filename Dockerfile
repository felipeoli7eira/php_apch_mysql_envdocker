FROM php:8.3-apache

RUN a2enmod rewrite

COPY ./conf/apache/000-default.conf /etc/apache2/sites-enabled/

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN docker-php-ext-install pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

WORKDIR /var/www/html

EXPOSE 80
