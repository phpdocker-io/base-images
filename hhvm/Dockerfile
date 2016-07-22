###########################
# PHPDocker.io HHVM image #
###########################

FROM debian:jessie

RUN sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 && \
    echo deb http://dl.hhvm.com/debian jessie main | sudo tee /etc/apt/sources.list.d/hhvm.list && \
    sudo apt-get update && \
    sudo apt-get install hhvm && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
