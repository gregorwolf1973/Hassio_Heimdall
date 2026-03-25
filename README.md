# Heimdall Home Assistant Add-on

Ich habe dieses Add-on erstellt, um Heimdall als Application Dashboard direkt in Home Assistant zu nutzen. Probiert es gerne aus, wenn es euch hilft freue ich mich 😊

## Über dieses Add-on

Dieses Add-on installiert **Heimdall** v2.7.6 als Home Assistant Add-on. Heimdall ist ein elegantes Application Dashboard zum Verwalten und schnellen Aufrufen aller eurer Web-Anwendungen und Services.

---

## Installation

1. Füge dieses Repository in Home Assistant hinzu:
   - Einstellungen → Add-ons → Add-on Store → ⋮ → Repository hinzufügen
   - URL eingeben: `https://github.com/gregorwolf1973/Hassio_Heimdall`
2. Das Add-on **Heimdall** suchen und installieren
3. Add-on starten
4. Heimdall über `http://homeassistant.local:8888` aufrufen

---

## Heimdall in der HA Seitenleiste einbinden

Da `panel_iframe` in neueren Home Assistant Versionen nicht mehr unterstützt wird, empfehlen wir eine **Webpage Card** im Dashboard:

### Option 1: Webpage Card im Dashboard

Füge eine neue Karte im HA Dashboard hinzu und wähle **manuell**:

```yaml
type: iframe
url: https://DEINE-DOMAIN.de
aspect_ratio: 100%
```

> `DEINE-DOMAIN.de` durch deine externe Domain ersetzen, z.B. über Nginx Proxy Manager eingerichtet.

### Option 2: Über Nginx Proxy Manager

Richte in NPM einen Proxy Host ein:
- **Domain:** z.B. `home.deine-domain.de`
- **Forward Hostname:** `172.30.33.X` (interne Docker IP des Containers)
- **Forward Port:** `8888`
- **SSL:** Let's Encrypt aktivieren

Dann die Webpage Card mit `https://home.deine-domain.de` verwenden.

---

## Konfiguration

| Option | Standard | Beschreibung |
|--------|---------|-------------|
| `port` | `8888` | Port für das Heimdall Web Interface |

---

## Animierte Hintergrundbilder (GIF)

Heimdall unterstützt animierte GIF-Hintergründe über die Custom CSS Funktion.

### Schritt 1: GIF in Home Assistant ablegen

Kopiere dein GIF in den HA-Medienordner per SSH oder Datei-Editor Add-on:

```
/config/www/hintergrundbild.gif
```

Das GIF ist dann erreichbar unter:
```
http://DEINE-HA-IP:8123/local/hintergrundbild.gif
```

### Schritt 2: Transparentes Platzhalterbild hochladen

Heimdall erfordert ein Hintergrundbild – lade ein transparentes 1x1 Pixel PNG als Hintergrundbild hoch damit das CSS-GIF nicht überschrieben wird:

> In Heimdall → Einstellungen → Hintergrund ein transparentes PNG hochladen

### Schritt 3: Custom CSS einfügen

In Heimdall → Einstellungen → Erweitert → Custom CSS folgendes einfügen:

```css
body::before {
    content: '';
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: url('http://DEINE-HA-IP:8123/local/hintergrundbild.gif') center/cover no-repeat;
    z-index: -1;
}
```

> `DEINE-HA-IP` durch die IP deines Home Assistant ersetzen, z.B. `192.168.178.37`

### Unterstützte Formate

| Format | Unterstützt | Empfehlung |
|--------|------------|------------|
| GIF | ✅ | Für animierte Hintergründe, kleine Dateigröße |
| JPG/PNG | ✅ | Für statische Hintergründe |

---

## Features

- Elegantes Application Dashboard
- Unterstützt hunderte von Apps mit Enhanced Links
- Persistente Datenspeicherung in `/share/heimdall`
- Unterstützt `amd64` und `aarch64`
- Direkter Zugriff über Port 8888
- Ingress Unterstützung (In Seitenleiste anzeigen)

---

## Datenspeicherung

Alle Daten werden unter `/share/heimdall/` gespeichert und bleiben auch nach einer Deinstallation des Add-ons erhalten.

---

## Support

Bei Problemen bitte ein [Issue erstellen](https://github.com/gregorwolf1973/Hassio_Heimdall/issues).
