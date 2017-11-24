####################################
# PHPDocker.io PHP 7.2 / CLI image #
####################################

FROM ubuntu

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux

# Install Ondrej repos for Ubuntu Xenial, PHP7.2, composer and selected extensions
RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main" > /etc/apt/sources.list.d/ondrej-php.list \
    && echo "deb http://ppa.launchpad.net/ondrej/php-qa/ubuntu xenial main" > /etc/apt/sources.list.d/ondrej-php-qa.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C \
    && apt-get update \
    && apt-get -y --no-install-recommends install git curl ca-certificates \
        php7.2-cli php7.2-curl php-apcu php-apcu-bc \
        php7.2-json php7.2-opcache php7.2-readline php7.2-xml php7.2-zip \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

CMD ["php", "-a"]

# If you'd like to be able to use this container on a docker-compose environment as a quiescent PHP CLI container
# you can /bin/bash into, override CMD with the following - bear in mind that this will make docker-compose stop
# slow on such a container, docker-compose kill might do if you're in a hurry
# CMD ["tail", "-f", "/dev/null"]
