FROM php:8.3-apache

RUN apt-get update && apt-get install -y \
    libicu-dev \
    && docker-php-ext-install intl pdo_mysql mysqli

# Remove directories if they exist and create necessary directories
RUN rm -rf tmp logs cache sessions uploads && \
    mkdir -p tmp logs cache sessions uploads && \
    find /var/www/html -type d -exec chmod 755 {} \; && \
    find /var/www/html -type f -exec chmod 644 {} \; && \
    chmod -R 775 /var/www/html/tmp /var/www/html/logs /var/www/html/cache /var/www/html/sessions /var/www/html/uploads && \
    chown -R www-data:www-data /var/www/html/tmp /var/www/html/logs /var/www/html/cache /var/www/html/sessions /var/www/html/uploads

# Enable Apache mod_rewrite
RUN a2enmod rewrite