# MängelLog — Play Store Submission Checkliste

## BUILD & CODE
- [ ] flutter analyze = 0 issues
- [ ] flutter build apk --release — APK-Größe unter 30 MB
- [ ] flutter build appbundle --release — AAB erstellt

## APK-TEST (physisches Gerät oder Emulator)
- [ ] Onboarding: alle 5 Screens navigierbar
- [ ] Screen 5: DSGVO-Checkbox blockiert Start bis Haken
- [ ] Home: Stats-Grid zeigt App-Farben korrekt (primary=#E8641A accent=#1A7A4E)
- [ ] Eintrag erstellen: Felder, Foto, Speichern, Toast "Gespeichert"
- [ ] Verlaufsliste: Einträge sichtbar, Icon-Farben alternieren
- [ ] AdMob: Testbanner sichtbar (nach ~30 Sekunden)
- [ ] Download-Button: Interstitial-Ad → Paywall-Screen
- [ ] Paywall: "Preis wird geladen…" (korrekt ohne Play Console Produkt)
- [ ] Paywall-Schließen: kein Crash
- [ ] Settings → Impressum WebView öffnet reivi.de/impressum?app=true
- [ ] Settings → Datenschutz WebView öffnet reivi.de/datenschutz?app=true
- [ ] Settings → AGB WebView öffnet reivi.de/agb?app=true
- [ ] App-Farben: primary=0xFFE8641A accent=0xFF1A7A4E
- [ ] Kein Crash beim schnellen Navigieren

## PLAY CONSOLE (manuell nach APK-Test)
- [ ] Neue App in Google Play Console anlegen
- [ ] In-App-Produkt erstellen: ID=maengellog_pdf_lifetime, Typ=Einmaliger Kauf
- [ ] Datenschutz-URL: https://reivi.de/datenschutz
- [ ] Content-Rating ausgefüllt
- [ ] App-Bundle (AAB) hochgeladen
- [ ] Store-Listing ausgefüllt (aus play_console_metadata.json)
- [ ] Icon 512×512 PNG hochgeladen
- [ ] Feature Graphic 1024×500 PNG hochgeladen
- [ ] Mindestens 2 Phone-Screenshots hochgeladen

## NACH GO-LIVE
- [ ] AdMob Test-IDs in app_config.dart durch echte ersetzen
- [ ] In-App-Produkt in Play Console aktivieren
- [ ] Build 1.0.1 erstellen und hochladen
