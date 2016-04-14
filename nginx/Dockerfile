########################################################
# PHPDocker.io nginx image                             #
#                                                      #
# Based on https://github.com/smebberson/docker-alpine #
########################################################

FROM alpine:latest
MAINTAINER PHPDocker.io

# Install nginx and link access and error logs to stdout
RUN apk add --update nginx && \
    rm -rf /var/cache/apk/* && \
    chown -R nginx:www-data /var/lib/nginx && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

# Add dockerising config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose HTTP/HTTPS ports
EXPOSE 80 443

ENTRYPOINT ["/usr/sbin/nginx"]
