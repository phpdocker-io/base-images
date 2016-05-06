############################
# PHPDocker.io Redis image #
############################

FROM alpine:latest

MAINTAINER PHPDocker.io

# Install Redis with default configuration
RUN apk --update add redis && \
  rm -rf /var/cache/apk/*

VOLUME /data
WORKDIR /data

EXPOSE 6379

ENTRYPOINT ["redis-server"]
