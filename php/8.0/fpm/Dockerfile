####################################
# PHPDocker.io PHP 8.0 / FPM image #
####################################

FROM phpdockerio/php80-cli

# Install FPM
RUN apt-get update \
    && apt-get -y --no-install-recommends install php8.0-fpm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

STOPSIGNAL SIGQUIT

# PHP-FPM packages need a nudge to make them docker-friendly
COPY overrides.conf /etc/php/8.0/fpm/pool.d/z-overrides.conf

CMD ["/usr/sbin/php-fpm8.0", "-O" ]

# Open up fcgi port
EXPOSE 9000
