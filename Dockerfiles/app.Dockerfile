FROM php:8.3.7-fpm-alpine3.19
ARG UID
RUN apk --update add shadow
RUN apk --update add php-session
RUN apk --update add php-tokenizer
RUN apk --update add php-xml
RUN apk --update add php-dom
RUN apk --update add php-xmlwriter
RUN apk --update add php-fileinfo
RUN usermod -u $UID www-data && groupmod -g $UID www-data
RUN apk --update add sudo
RUN echo "www-data ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN apk --update add composer
RUN docker-php-ext-install pdo_mysql
RUN apk add --update npm
RUN apk add --update make
ARG UID=1000
RUN usermod -u $UID www-data && groupmod -g $UID www-data
COPY wait-for-it.sh /usr/local/bin/wait-for-it
RUN chmod +x /usr/local/bin/wait-for-it
