#!/bin/sh
set -e

# Port aus Konfiguration lesen
PORT=$(bashio::config 'port')
export APP_PORT=${PORT:-8888}

# Persistente Daten in /share/heimdall
mkdir -p /share/heimdall/database
mkdir -p /share/heimdall/storage/app/public
mkdir -p /share/heimdall/storage/framework/cache/data
mkdir -p /share/heimdall/storage/framework/sessions
mkdir -p /share/heimdall/storage/framework/views
mkdir -p /share/heimdall/storage/logs
mkdir -p /share/heimdall/public/uploads
mkdir -p /share/heimdall/public/icons

# .env Datei erstellen falls nicht vorhanden
if [ ! -f /share/heimdall/.env ]; then
    cp /var/www/heimdall.dist/.env.example /share/heimdall/.env
fi

# APP_URL immer leeren damit relative URLs verwendet werden
sed -i "s|APP_URL=.*|APP_URL=|" /share/heimdall/.env

# Symlinks zu persistenten Daten
rm -rf /var/www/heimdall/storage
rm -rf /var/www/heimdall/public/uploads
rm -rf /var/www/heimdall/public/icons
rm -rf /var/www/heimdall/public/storage

ln -sf /share/heimdall/storage /var/www/heimdall/storage
ln -sf /share/heimdall/public/uploads /var/www/heimdall/public/uploads
ln -sf /share/heimdall/public/icons /var/www/heimdall/public/icons
ln -sf /share/heimdall/.env /var/www/heimdall/.env
ln -sf /var/www/heimdall/storage/app/public /var/www/heimdall/public/storage

# Datenbank SQLite anlegen falls nicht vorhanden
if [ ! -f /share/heimdall/database/app.sqlite ]; then
    touch /share/heimdall/database/app.sqlite
fi
ln -sf /share/heimdall/database/app.sqlite /var/www/heimdall/database/app.sqlite

# APP_KEY generieren falls nicht gesetzt
cd /var/www/heimdall
if ! grep -q "^APP_KEY=.\+" /share/heimdall/.env; then
    php83 artisan key:generate --force
fi

# Datenbank migrieren
php83 artisan migrate --force

# Cache leeren
php83 artisan config:clear
php83 artisan cache:clear
php83 artisan view:clear

# Berechtigungen setzen
chmod -R 777 /share/heimdall/storage
chmod -R 777 /share/heimdall/public/uploads
chmod -R 777 /share/heimdall/public/icons
chmod -R 777 /share/heimdall/database
chown -R nobody:nobody /share/heimdall
chown -R nobody:nobody /var/www/heimdall

# PHP-FPM starten
php-fpm83 -D

# Nginx starten
exec nginx -g 'daemon off;'
