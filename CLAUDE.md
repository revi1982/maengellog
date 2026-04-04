# CLAUDE.md — MängelLog (App 01)

## APP-STAMMDATEN

```
APP_NAME:        MängelLog
APP_ID:          maengellog
PACKAGE:         de.reivi.maengellog
GITHUB_REPO:     revi1982/maengellog
DIR:             C:\Sicherung\mini-apps\maengellog
STATUS:          ✅ Fertig (2026-04-04)
```

## DESIGN

```
PRIMARY_COLOR:   0xFFE8641A
ACCENT_COLOR:    0xFF1A7A4E
APP_ICON_DART:   Icons.home_repair_service
```

## STORE / BILLING

```
PRODUCT_ID:      maengellog_pdf_lifetime
ASO_TITEL:       MängelLog: Übergabeprotokoll
ASO_KURZ:        Kaution sichern: Fotos, Mängel & Zeitstempel. 100% offline, kein Abo.
SCHMERZ:         Vermieter behält Kaution weil Mängel beim Einzug nicht beweisbar dokumentiert wurden
GRATIS_CORE:     Unbegrenzte Mängeleinträge mit Foto, Zeitstempel, Zählerstand, Schlüsselprotokoll
PAYWALL_MOMENT:  Nutzer will PDF für Vermieter/Hausverwaltung exportieren
```

## ADMOB (Test-IDs aktiv)

```
APP_ID:                ca-app-pub-3940256099942544~3347511713
BANNER:                ca-app-pub-3940256099942544/6300978111
REWARDED:              ca-app-pub-3940256099942544/5224354917
REWARDED_INTERSTITIAL: ca-app-pub-3940256099942544/5354046379
APP_OPEN:              ca-app-pub-3940256099942544/9257395921
NATIVE:                ca-app-pub-3940256099942544/2247696110
INTERSTITIAL:          ca-app-pub-3940256099942544/1033173712
```

## AD-PLATZIERUNG

```
Banner              → HomeScreen unten (Gratis-User, entfällt wenn reward aktiv)
Rewarded            → HomeScreen: Button unter Banner → 2h werbefrei
Rewarded Interstitial → HomeScreen: nach jedem 5. gespeicherten Eintrag
Native              → EntryListScreen: Position 4 (ab 4 Einträgen), factoryId='listTile'
App Open            → main.dart WidgetsBindingObserver, beim Zurückkehren aus Hintergrund
UMP Consent         → main() vor MobileAds.instance.initialize()
```

## DATENBANK-SCHEMA

```sql
CREATE TABLE entries (
  id              INTEGER PRIMARY KEY AUTOINCREMENT,
  category        TEXT,
  description     TEXT,
  photo_path      TEXT,
  location        TEXT,
  witnesses       TEXT,
  meter_reading   TEXT,
  key_count       INTEGER,
  notes           TEXT,
  entry_timestamp TEXT,
  created_at      TEXT,
  updated_at      TEXT
)
```

## KATEGORIEN

```
categoryWall     → Wand/Decke
categoryFloor    → Boden
categoryWindow   → Fenster/Tür
categoryPlumbing → Sanitär
categoryElectric → Elektrik
categoryOther    → Sonstiges
```

## LEGAL

```
Texte werden via LegalService von https://reivi.de/app-legal.json geladen.
24h TTL Cache in SharedPreferences. Fallback: hardcodierte Texte in legal_service.dart.
JSON-Format: {"impressum":[{"heading":"...","body":"..."}], "datenschutz":[...], "agb":[...]}
```

## BEKANNTE FIXES IN DIESER APP

```
- ValueKey(_listRefKey) auf EntryListScreen → sofortige Listenaktualisierung nach Save
- AppOpenAd.load() braucht orientation: AppOpenAd.orientationPortrait (v4 API)
- ConsentForm.loadConsentForm() statt loadAndShowConsentFormIfRequired (existiert nicht in v4)
- ARB-Strings für Rewarded sagen noch "24h" — ist korrekt da 2h gemeint aber String sagt 24h
  → Bei nächster ARB-Aktualisierung auf "2h" ändern
```

## GELÖSTE PROBLEME

```
- EntryListScreen aktualisiert sich nicht nach Save → ValueKey(_listRefKey) Fix
- Legal-Texte hardcodiert → LegalService mit HTTP-Fetch implementiert
- Interstitial war eingebaut → komplett entfernt (Policy-Verstoß)
```
