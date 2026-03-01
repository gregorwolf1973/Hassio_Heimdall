# Heimdall Home Assistant Add-on

![Heimdall Logo](https://raw.githubusercontent.com/linuxserver/Heimdall/master/public/img/heimdall-icon.png)

Ich habe dieses Add-on erstellt, um Heimdall als Application Dashboard direkt in Home Assistant zu nutzen. Probiert es gerne aus, wenn es euch hilft freue ich mich ;-)

## Über dieses Add-on

Dieses Add-on installiert [Heimdall](https://heimdall.site) v2.7.6 als Home Assistant Add-on. Heimdall ist ein elegantes Application Dashboard zum Verwalten und schnellen Aufrufen aller eurer Web-Anwendungen und Services.

## Installation

[![Repository zu Home Assistant hinzufügen](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fgregorwolf1973%2FHassio_Heimdall)

Oder manuell:
1. Füge dieses Repository in Home Assistant hinzu:
   - Einstellungen → Add-ons → Add-on Store → ⋮ → Repository hinzufügen
   - URL eingeben: `https://github.com/gregorwolf1973/Hassio_Heimdall`
2. Das Add-on **Heimdall** suchen und installieren
3. Add-on starten
4. Heimdall über `http://homeassistant.local:8888` aufrufen

## Features

- Elegantes Application Dashboard
- Unterstützt hunderte von Apps mit Enhanced Links
- Persistente Datenspeicherung in `/share/heimdall`
- Unterstützt `amd64` und `aarch64`
- Direkter Zugriff über Port 8888

## Datenspeicherung

Alle Daten werden unter `/share/heimdall/` gespeichert und bleiben auch nach einer Deinstallation des Add-ons erhalten.

## Support

Bei Problemen bitte ein [Issue erstellen](https://github.com/gregorwolf1973/Hassio_Heimdall/issues).
