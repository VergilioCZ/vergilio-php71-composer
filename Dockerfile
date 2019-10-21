FROM php:7.1.26

RUN apt-get update -y && apt-get install -y unzip libpng-dev libxml2-dev

RUN docker-php-ext-install pdo pdo_mysql mysqli soap intl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN a2enmod rewrite
RUN a2enmod ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -subj "/C=CZ/ST=Prague/L=Prague/O=OrgName/OU=IT Department/CN=example.com"

