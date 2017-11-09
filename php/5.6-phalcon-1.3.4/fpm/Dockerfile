FROM phpdockerio/php56-fpm:latest
WORKDIR "/application"

RUN /usr/bin/apt-get update && apt-get -y install git php5-dev libpcre3-dev gcc make && \
    cd /tmp && \
    /usr/bin/git clone git://github.com/phalcon/cphalcon.git && \
    cd cphalcon && \
    git checkout tags/phalcon-v1.3.4 && \
    cd build/ && \
    ./install && \
    cd /tmp && \
    /bin/rm -rf /tmp/cphalcon/ && \
    /usr/bin/apt-get -y purge git php5-dev libpcre3-dev gcc make && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    /bin/echo 'extension=phalcon.so' >/etc/php5/mods-available/phalcon.ini && \
    /usr/sbin/php5enmod phalcon
