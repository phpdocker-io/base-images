#####################################
#      PHPDocker.io Base Image      #
#####################################

FROM debian:jessie

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux

# Install cURL and nano
RUN apt-get update \
    && apt-get install -y --no-install-recommends git curl ca-certificates nano \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
