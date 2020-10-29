####################################
# PHPDocker.io PHP 5.6 / CLI image #
####################################

FROM debian:jessie

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        curl \
        ca-certificates \
        unzip \
        php5-cli \
        php5-apcu \
        php5-curl \
        php5-json \
        php5-mcrypt \
        php5-readline \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

CMD ["php", "-a"]

# If you'd like to be able to use this container on a docker-compose environment as a quiescent PHP CLI container
# you can /bin/bash into, override CMD with the following - bear in mind that this will make docker-compose stop
# slow on such a container, docker-compose kill might do if you're in a hurry
# CMD ["tail", "-f", "/dev/null"]
