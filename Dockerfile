##########################################
# PHPDocker.io PHP CLI and FPM image      #
# Build with --build-arg PHP_VERSION=8.x  #
##########################################

# Ubuntu release the image is based on, also used to pick the Ondrej PPA suite
ARG UBUNTU=noble

### CLI ###

FROM ubuntu:${UBUNTU} AS cli

ARG UBUNTU
ARG PHP_VERSION

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux

# Ensure apt doesn't ask questions when installing stuff
ENV DEBIAN_FRONTEND=noninteractive

# Install Ondrej repos for Ubuntu, PHP, composer and selected extensions - better selection than
# the distro's packages
#
# From PHP 8.5 opcache is built into the PHP runtime and there is no separate package for it.
RUN test -n "${PHP_VERSION}" || { echo "PHP_VERSION build arg is required" >&2; exit 1; } \
    && OPCACHE="" \
    && if dpkg --compare-versions "${PHP_VERSION}" lt 8.5; then OPCACHE="php${PHP_VERSION}-opcache"; fi \
    && apt-get update \
    && apt-get install -y --no-install-recommends gnupg \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu ${UBUNTU} main" > /etc/apt/sources.list.d/ondrej-php.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        ca-certificates \
        curl \
        unzip \
        php${PHP_VERSION}-apcu \
        php${PHP_VERSION}-cli \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-mbstring \
        ${OPCACHE} \
        php${PHP_VERSION}-readline \
        php${PHP_VERSION}-xml \
        php${PHP_VERSION}-zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

CMD ["php", "-a"]

### FPM ###

FROM cli AS fpm

ARG PHP_VERSION

# Install FPM. The version-independent symlink lets CMD (exec form, no ARG expansion) avoid the version.
RUN apt-get update \
    && apt-get -y --no-install-recommends install php${PHP_VERSION}-fpm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* \
    && ln -s /usr/sbin/php-fpm${PHP_VERSION} /usr/sbin/php-fpm

STOPSIGNAL SIGQUIT

# PHP-FPM packages need a nudge to make them docker-friendly
COPY overrides.conf /etc/php/${PHP_VERSION}/fpm/pool.d/z-overrides.conf

CMD ["/usr/sbin/php-fpm", "-O" ]

# Open up fcgi port
EXPOSE 9000
