# Heimdall

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://buymeacoffee.com/gregorwolf1973)

Heimdall ist ein elegantes Application Dashboard, mit dem sich alle Web-Anwendungen und Dienste im Heimnetz an einer Stelle sammeln und schnell aufrufen lassen. Dieses Add-on installiert Heimdall v2.7.6 mit nginx und PHP 8.3 FPM.

## Installation

1. Repository in Home Assistant hinzufügen:
   - Einstellungen → Apps → App installieren → ⋮ → Repositories
   - URL eingeben: `https://github.com/gregorwolf1973/Hassio_Heimdall`
2. Das Add-on **Heimdall** suchen und installieren
3. Add-on starten

## Zugriff

Nach dem Start ist Heimdall unter `http://homeassistant.local:8888` erreichbar,
alternativ über den Button **Web UI** auf der Add-on-Seite.

Im Dashboard lässt sich Heimdall über eine **Webpage Card** (`type: iframe`)
einbinden. Für den Zugriff von außen empfiehlt sich ein Reverse Proxy
(z. B. Nginx Proxy Manager) mit eigenem Zertifikat.

## Konfiguration

Das Add-on hat keine eigenen Optionen.

Der Webserver läuft im Container fest auf Port `8888`. Soll der Port am Host ein
anderer sein, lässt sich die Zuordnung in der Add-on-Konfiguration unter
**Netzwerk** ändern.

## Datenspeicherung

Alle Daten (Datenbank, Einstellungen, hochgeladene Icons und Hintergründe)
liegen unter `/share/heimdall/`:

- `/share/heimdall/database/app.sqlite` – SQLite-Datenbank
- `/share/heimdall/.env` – Heimdall-Konfiguration
- `/share/heimdall/storage`, `/share/heimdall/public/uploads`, `/share/heimdall/public/icons`

Die Daten bleiben bei einem Update oder einer Deinstallation des Add-ons
erhalten. Sie werden von den Home-Assistant-Backups erfasst, sofern `/share`
im Backup enthalten ist.

## Animierte Hintergrundbilder

Heimdall kann über **Einstellungen → Erweitert → Custom CSS** ein animiertes GIF
als Hintergrund anzeigen. Das GIF dazu in den `www`-Ordner der
Home-Assistant-Konfiguration legen (`/config/www/hintergrundbild.gif`), es ist
dann unter `http://DEINE-HA-IP:8123/local/hintergrundbild.gif` erreichbar.
Details dazu stehen in der [README](https://github.com/gregorwolf1973/Hassio_Heimdall#animierte-hintergrundbilder-gif).

## Unterstützte Architekturen

`amd64` und `aarch64`.

## Support

Bei Problemen bitte ein [Issue erstellen](https://github.com/gregorwolf1973/Hassio_Heimdall/issues).
