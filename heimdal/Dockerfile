ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.24-2026.08.0
FROM ${BUILD_FROM}

RUN apk add --no-cache \
    nginx \
    php84 \
    php84-fpm \
    php84-session \
    php84-gd \
    php84-xml \
    php84-mbstring \
    php84-openssl \
    php84-ctype \
    php84-zip \
    php84-fileinfo \
    php84-pdo \
    php84-pdo_sqlite \
    php84-sqlite3 \
    php84-tokenizer \
    php84-dom \
    php84-xmlwriter \
    php84-simplexml \
    php84-curl \
    php84-intl \
    php84-bcmath \
    php84-iconv \
    wget \
    unzip \
    git

# PHP Upload-Limits erhöhen
RUN echo "upload_max_filesize = 50M" >> /etc/php84/php.ini && \
    echo "post_max_size = 50M" >> /etc/php84/php.ini && \
    echo "memory_limit = 256M" >> /etc/php84/php.ini && \
    echo "max_execution_time = 300" >> /etc/php84/php.ini

# Heimdall herunterladen
RUN wget -q https://github.com/linuxserver/Heimdall/archive/refs/tags/v2.8.4.tar.gz -O /tmp/heimdall.tar.gz \
    && mkdir -p /var/www/heimdall \
    && tar -xzf /tmp/heimdall.tar.gz -C /var/www/heimdall --strip-components=1 \
    && rm /tmp/heimdall.tar.gz \
    && cp -r /var/www/heimdall /var/www/heimdall.dist \
    && chown -R nobody:nobody /var/www/heimdall

# php Symlink erstellen damit Artisan funktioniert
RUN ln -sf /usr/bin/php84 /usr/bin/php

COPY nginx.conf /etc/nginx/nginx.conf
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
