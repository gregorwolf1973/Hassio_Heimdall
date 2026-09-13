# Changelog

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
