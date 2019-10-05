# Build command: docker build -t php:jj .
FROM php:7.3.10-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev icu-devtools libzip-dev zlib1g-dev libicu-dev g++ \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install -j$(nproc) zip && docker-php-ext-configure zip
RUN docker-php-ext-install -j$(nproc) intl && docker-php-ext-configure intl
RUN docker-php-ext-install -j$(nproc) mysqli && docker-php-ext-configure mysqli
RUN docker-php-ext-install -j$(nproc) pdo_mysql && docker-php-ext-configure pdo_mysql
