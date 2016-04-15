####################################
# PHPDocker.io PHP 5.6 / FPM image #
####################################

FROM debian:jessie

# Install dotdeb repo, PHP, composer and selected extensions
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get -y --no-install-recommends install php5-cli php5-fpm php5-apcu php5-curl php5-json php5-mcrypt php5-readline \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Configure FPM to run properly on docker
RUN sed -i "/listen = .*/c\listen = [::]:9000" /etc/php5/fpm/pool.d/www.conf \
    && sed -i "/;access.log = .*/c\access.log = /proc/self/fd/2" /etc/php5/fpm/pool.d/www.conf \
    && sed -i "/;clear_env = .*/c\clear_env = no" /etc/php5/fpm/pool.d/www.conf \
    && sed -i "/;catch_workers_output = .*/c\catch_workers_output = yes" /etc/php5/fpm/pool.d/www.conf \
    && sed -i "/pid = .*/c\;pid = /run/php/php5-fpm.pid" /etc/php5/fpm/php-fpm.conf \
    && sed -i "/;daemonize = .*/c\daemonize = no" /etc/php5/fpm/php-fpm.conf \
    && sed -i "/error_log = .*/c\error_log = /proc/self/fd/2" /etc/php5/fpm/php-fpm.conf \
    && usermod -u 1000 www-data

EXPOSE 9000
CMD ["/usr/sbin/php5-fpm"]
