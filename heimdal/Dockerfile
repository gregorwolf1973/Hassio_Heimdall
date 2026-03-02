ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN apk add --no-cache \
    nginx \
    php83 \
    php83-fpm \
    php83-session \
    php83-json \
    php83-gd \
    php83-xml \
    php83-mbstring \
    php83-openssl \
    php83-ctype \
    php83-zip \
    php83-fileinfo \
    php83-pdo \
    php83-pdo_sqlite \
    php83-sqlite3 \
    php83-tokenizer \
    php83-dom \
    php83-xmlwriter \
    php83-simplexml \
    php83-curl \
    php83-intl \
    php83-bcmath \
    wget \
    unzip \
    git

# PHP Upload-Limits erhöhen
RUN echo "upload_max_filesize = 50M" >> /etc/php83/php.ini && \
    echo "post_max_size = 50M" >> /etc/php83/php.ini && \
    echo "memory_limit = 256M" >> /etc/php83/php.ini && \
    echo "max_execution_time = 300" >> /etc/php83/php.ini

# Heimdall herunterladen
RUN wget -q https://github.com/linuxserver/Heimdall/archive/refs/tags/v2.7.6.tar.gz -O /tmp/heimdall.tar.gz \
    && mkdir -p /var/www/heimdall \
    && tar -xzf /tmp/heimdall.tar.gz -C /var/www/heimdall --strip-components=1 \
    && rm /tmp/heimdall.tar.gz \
    && cp -r /var/www/heimdall /var/www/heimdall.dist \
    && chown -R nobody:nobody /var/www/heimdall

# php Symlink erstellen damit Artisan funktioniert
RUN ln -sf /usr/bin/php83 /usr/bin/php

COPY nginx.conf /etc/nginx/nginx.conf
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
