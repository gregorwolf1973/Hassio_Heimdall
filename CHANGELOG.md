# Changelog

## 2.7.18

- Fix: Das Paket `php83-json` wird nicht mehr installiert. Es existiert im
  Basis-Image (Alpine 3.24) nicht mehr, weil die JSON-Funktionen seit PHP 8.0
  fest in PHP eingebaut sind und das separate Paket entfernt wurde. Der
  Image-Build schlug dadurch fehl.

## 2.7.17

- Fix: Die Option "port" ist entfernt. Sie hat nginx im Container auf einen
  anderen Port umgestellt, waehrend Home Assistant weiterhin Containerport
  8888 abgebildet hat. Jeder andere Wert als 8888 machte das Addon
  unerreichbar. Der Host-Port laesst sich weiterhin in der Addon-Konfiguration
  unter "Netzwerk" einstellen.
- Basis-Image auf eine feste Version gepinnt (3.24-2026.08.0) statt "latest",
  damit Builds reproduzierbar sind.
- Laufzeitverzeichnis /run/nginx wird angelegt, damit nginx seine PID-Datei
  schreiben kann.
- Repository-Link in der Addon-Konfiguration ergaenzt.
