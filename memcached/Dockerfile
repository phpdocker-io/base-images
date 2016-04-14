################################
# PHPDocker.io memcached image #
################################

FROM alpine:latest

MAINTAINER PHPDocker.io

# Install packages
RUN \
  apk --update add memcached && \
  rm -rf /var/cache/apk/*

VOLUME /data
WORKDIR /data

EXPOSE 11211

ENTRYPOINT ["memcached"]
