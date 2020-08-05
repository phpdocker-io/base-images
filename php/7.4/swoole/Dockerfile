#######################################
# PHPDocker.io PHP 7.4 / Swoole image #
#######################################

FROM phpdockerio/php74-cli

# Install the latest available published swoole release
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        build-essential \
        git \
        jq \
        php7.4-dev \
    && cd /tmp \
    && export SWOOLE_VERSION=`curl -s https://api.github.com/repos/swoole/swoole-src/releases/latest |jq -r .tag_name` \
    && git clone https://github.com/swoole/swoole-src.git \
    && cd swoole-src \
    && git checkout ${SWOOLE_VERSION} \
    && phpize \
    && ./configure --enable-openssl --enable-http2 --enable-sockets --enable-mysqlnd \
    && make \
    && make install-modules \
    && echo "extension=swoole.so" >> /etc/php/7.4/cli/php.ini \
    && apt-get autoremove --purge -y git php7.4-dev build-essential \
    && cd / \
    && rm -rf /tmp/swole-src \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
