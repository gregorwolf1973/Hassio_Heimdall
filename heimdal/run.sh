#!/bin/sh
set -e

# Persistente Daten in /share/heimdall
mkdir -p /share/heimdall/database
mkdir -p /share/heimdall/storage/app
mkdir -p /share/heimdall/storage/framework/cache
mkdir -p /share/heimdall/storage/framework/sessions
mkdir -p /share/heimdall/storage/framework/views
mkdir -p /share/heimdall/storage/logs
mkdir -p /share/heimdall/public/uploads

# .env Datei erstellen falls nicht vorhanden
if [ ! -f /share/heimdall/.env ]; then
    cp /var/www/heimdall.dist/.env.example /share/heimdall/.env
fi

# Symlinks zu persistenten Daten
rm -rf /var/www/heimdall/storage
rm -rf /var/www/heimdall/public/uploads

ln -sf /share/heimdall/storage /var/www/heimdall/storage
ln -sf /share/heimdall/public/uploads /var/www/heimdall/public/uploads
ln -sf /share/heimdall/.env /var/www/heimdall/.env

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

# Berechtigungen setzen
chown -R nobody:nobody /share/heimdall
chown -R nobody:nobody /var/www/heimdall/storage

# PHP-FPM starten
php-fpm83 -D

# Nginx starten
exec nginx -g 'daemon off;'
