#######################################
# PHPDocker.io PHP 7.4 / Swoole image #
#######################################

FROM phpdockerio/php74-cli

# Install the latest available published swoole release
RUN apt-get update \
    && apt-get -y --no-install-recommends install php7.4-swoole \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
