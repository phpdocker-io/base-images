#######################################
# PHPDocker.io PHP 8.0 / Swoole image #
#######################################

FROM phpdockerio/php80-cli

# Install the latest available published swoole release
RUN apt-get update \
    && apt-get -y --no-install-recommends install php8.0-swoole \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
