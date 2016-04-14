############################
# PHPDocker.io Redis image #
############################

FROM alpine:latest

MAINTAINER PHPDocker.io

# Install memcached, gosu (will switch to alpine package when available)
RUN \
  apk --update add redis && \
  rm -rf /var/cache/apk/*

VOLUME /data
WORKDIR /data

EXPOSE 11211

ENTRYPOINT ["redis-server"]
