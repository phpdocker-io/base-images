####################################
# PHPDocker.io PHP 7.0 / CLI image #
####################################

FROM ubuntu:xenial

# PHP7, composer and selected extensions
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        curl \
        ca-certificates \
        unzip \
        php-cli \
        php-apcu \
        php-curl \
        php-json \
        php-mcrypt \
        php-mbstring \
        php-opcache \
        php-readline \
        php-xml \
        php-zip \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

CMD ["php", "-a"]

# If you'd like to be able to use this container on a docker-compose environment as a quiescent PHP CLI container
# you can /bin/bash into, override CMD with the following - bear in mind that this will make docker-compose stop
# slow on such a container, docker-compose kill might do if you're in a hurry
# CMD ["tail", "-f", "/dev/null"]
