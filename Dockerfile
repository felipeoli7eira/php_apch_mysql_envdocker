FROM php:8.2-apache

RUN a2enmod rewrite

COPY ./conf/apache/000-default.conf /etc/apache2/sites-enabled/

# Instala pacotes necessários
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev \
    gnupg \
    ca-certificates

# Instala Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs

# Instala Xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Instala extensões PHP
RUN docker-php-ext-install pdo pdo_mysql

# Copia o Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Define diretório de trabalho
WORKDIR /var/www/html

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN groupadd -g $GROUP_ID devgroup && \
    useradd -m -u $USER_ID -g devgroup devuser && \
    chown -R devuser:devgroup /var/www/html

USER devuser

EXPOSE 80
