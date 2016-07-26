#####################################
#      PHPDocker.io Base Image      #
#####################################

FROM debian:jessie

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux

# Install cURL
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
