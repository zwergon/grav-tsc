FROM php:fpm

RUN apt-get update && apt-get install -y \
		zlib1g-dev libpng-dev
RUN docker-php-ext-install opcache
RUN apt-get install -y libicu-dev
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) gd
RUN apt-get install -y \
        libzip-dev \
        zip
RUN docker-php-ext-install zip

# RUN apt-get install -y apt-utils
