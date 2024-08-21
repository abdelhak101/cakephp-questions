FROM php:8.3-apache

RUN apt-get update && apt-get install -y \
    libicu-dev \
    && docker-php-ext-install intl pdo_mysql mysqli
