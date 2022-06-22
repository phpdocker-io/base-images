#####################################################################################################################
# nginx with PageSpeed                                                                                              #
#                                                                                                                   #
# The official image (https://hub.docker.com/r/pagespeed/nginx-pagespeed) is abandoned and of course it runs a very #
# old and unpatched version of both nginx, its base OS and the pagespeed module itself.                             #
#                                                                                                                   #
# This image uses the official installer script to install it into Ubuntu Focal (debian as base results in fatter   #
# image sizes) then proceeds to compile nginx with pagespeed support using the same flags Ubuntu Focal's own nginx  #
# uses.                                                                                                             #
#                                                                                                                   #
# The user, entrypoint & folder setup have been lifted straight from nginx's debian base image Dockerfile.          #
#####################################################################################################################

FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

# Options: latest-stable, latest-beta, a version number
ARG NGINX_PAGESPEED_VERSION=latest-stable

# Options: latest (nginx mainline) or a version number from here: http://nginx.org/download/
# Note: looks like nginx 1.22 is the last version compatible with ngx_pagespeed and there haven't been commits to the pagespeed repository for over 2 years
ARG NGINX_VERSION=1.22.0

COPY install-pagespeed.sh /tmp/install-pagespeed.sh

# Build nginx with pagespeed from source with the same build flags Ubuntu uses
# Unfortunately the build installer does not support alpine, so these images will be somewhat fatter than
# they'd be otherwise
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        openssl \
        libssl-dev \
        sudo \
        build-essential \
    && /tmp/install-pagespeed.sh -y \
        --ngx-pagespeed-version ${NGINX_PAGESPEED_VERSION} \
        --nginx-version ${NGINX_VERSION} \
        -a "--prefix=/etc/nginx \
        --sbin-path=/usr/sbin/nginx \
        --modules-path=/usr/lib/nginx/modules \
        --conf-path=/etc/nginx/nginx.conf \
        --error-log-path=/var/log/nginx/error.log \
        --http-log-path=/var/log/nginx/access.log \
        --pid-path=/var/run/nginx.pid \
        --lock-path=/var/run/nginx.lock \
        --http-client-body-temp-path=/var/cache/nginx/client_temp \
        --http-proxy-temp-path=/var/cache/nginx/proxy_temp\
        --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
        --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
        --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
        --with-perl_modules_path=/usr/lib/perl5/vendor_perl \
        --user=nginx \
        --group=nginx \
        --with-compat \
        --with-file-aio \
        --with-threads \
        --with-http_addition_module \
        --with-http_auth_request_module \
        --with-http_dav_module \
        --with-http_flv_module \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_mp4_module \
        --with-http_random_index_module \
        --with-http_realip_module \
        --with-http_secure_link_module \
        --with-http_slice_module \
        --with-http_ssl_module \
        --with-http_stub_status_module \
        --with-http_sub_module \
        --with-http_v2_module \
        --with-mail \
        --with-mail_ssl_module \
        --with-stream \
        --with-stream_realip_module \
        --with-stream_ssl_module \
        --with-stream_ssl_preread_module \
        --with-cc-opt='-Os -fomit-frame-pointer -g' \
        --with-ld-opt=-Wl,--as-needed,-O1,--sort-common" \
    && export SUDO_FORCE_REMOVE=yes \
    && apt-get autoremove --purge -y \
        curl \
        sudo \
        build-essential \
        zlib1g-dev \
        libpcre3-dev \
        unzip \
        wget \
        uuid-dev \
    && apt-get clean \
    && rm -rf /root/* /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

# Set up nginx environment: user, logs and various folders
RUN  addgroup --system --gid 101 nginx \
    && adduser --system --disabled-login --ingroup nginx --no-create-home --home /nonexistent --gecos "nginx user" --shell /bin/false --uid 101 nginx \
    && mkdir -p /var/log/nginx /var/cache/nginx/ /var/ngx_pagespeed_cache \
    && chown nginx:nginx /var/cache/nginx /var/log/nginx /var/ngx_pagespeed_cache\
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && chmod 777 /var/run \
    && mkdir -p /docker-entrypoint.d

# Set up entrypoint (same scripts as official nginx image)
COPY docker-entrypoint.sh /
COPY 10-listen-on-ipv6-by-default.sh /docker-entrypoint.d
COPY 20-envsubst-on-templates.sh /docker-entrypoint.d
COPY 30-tune-worker-processes.sh /docker-entrypoint.d

COPY nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["/docker-entrypoint.sh"]

# Disable installation of nginx packages on the system
COPY apt-preferences-disable-nginx /etc/apt/preferences.d/disable-nginx

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
