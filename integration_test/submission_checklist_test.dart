// ============================================================================
// MängelLog — Automatisierter Submission Checklist Test
// Führt alle Punkte der SUBMISSION_CHECKLIST.md automatisch aus.
//
// Ausführung:
//   flutter test integration_test/submission_checklist_test.dart -d <device_id>
//
// Gerät muss auf Deutsch eingestellt sein (oder Emulator mit de_DE Locale).
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:maengellog/main.dart' as app;

// ── Hilfsfunktionen ──────────────────────────────────────────────────────────

/// Startet die App mit festgelegtem Initialzustand.
Future<void> _launchApp(
  WidgetTester tester, {
  bool onboardingDone = true,
  bool isPremium = false,
}) async {
  SharedPreferences.setMockInitialValues({
    'onboarding_done': onboardingDone,
    'is_premium': isPremium,
  });
  await app.main();
  await tester.pumpAndSettle(const Duration(seconds: 4));
}

/// Druckt Testergebnis mit Icon.
void _pass(String label) => debugPrint('✅ PASS: $label');
void _info(String msg)  => debugPrint('ℹ️  INFO: $msg');

// ── Tests ─────────────────────────────────────────────────────────────────────

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // ── T01: Onboarding — alle 5 Screens navigierbar ─────────────────────────
  testWidgets('T01 | Onboarding — 5 Screens navigierbar', (tester) async {
    await _launchApp(tester, onboardingDone: false);

    // Screen 0 muss sichtbar sein
    expect(
      find.textContaining('Kaution'),
      findsWidgets,
      reason: 'Onboarding Screen 0 nicht sichtbar',
    );
    _info('Screen 0 sichtbar: "Kaution..."');

    // 4x "Weiter →" tippen → alle 5 Screens durchlaufen
    for (int i = 1; i <= 4; i++) {
      final weiterBtn = find.widgetWithText(ElevatedButton, 'Weiter →');
      expect(weiterBtn, findsOneWidget, reason: 'Weiter-Button auf Screen $i fehlt');
      await tester.tap(weiterBtn);
      await tester.pumpAndSettle();
      _info('Screen $i erreicht');
    }

    // Screen 4 (DSGVO) muss aktiv sein
    expect(
      find.text('Datenschutz'),
      findsWidgets,
      reason: 'DSGVO-Screen (Screen 4) nicht erreicht',
    );

    _pass('T01 — Alle 5 Onboarding-Screens navigierbar');
  });

  // ── T02: DSGVO — Checkbox blockiert Start ────────────────────────────────
  testWidgets('T02 | DSGVO — Checkbox blockiert Start', (tester) async {
    await _launchApp(tester, onboardingDone: false);

    // Zu Screen 4 navigieren
    for (int i = 0; i < 4; i++) {
      await tester.tap(find.widgetWithText(ElevatedButton, 'Weiter →'));
      await tester.pumpAndSettle();
    }

    // "Einverstanden & Starten →" muss DEAKTIVIERT sein (Checkbox nicht angehakt)
    final startBtn = tester.widget<ElevatedButton>(
      find.widgetWithText(ElevatedButton, 'Einverstanden & Starten →'),
    );
    expect(
      startBtn.onPressed,
      isNull,
      reason: 'Start-Button war aktiv ohne DSGVO-Consent — FEHLER',
    );
    _info('Start-Button korrekt deaktiviert ohne Checkbox');

    // Checkbox antippen
    await tester.tap(find.byType(Checkbox));
    await tester.pumpAndSettle();

    // Button muss jetzt AKTIV sein
    final startBtnAfter = tester.widget<ElevatedButton>(
      find.widgetWithText(ElevatedButton, 'Einverstanden & Starten →'),
    );
    expect(
      startBtnAfter.onPressed,
      isNotNull,
      reason: 'Start-Button nach Checkbox-Haken immer noch deaktiviert',
    );

    _pass('T02 — DSGVO-Checkbox blockiert Start korrekt');
  });

  // ── T03: Home — Stats-Grid und App-Farben ────────────────────────────────
  testWidgets('T03 | Home — Stats-Grid, App-Farben, App-Name', (tester) async {
    await _launchApp(tester, onboardingDone: true);

    // App-Name sichtbar
    expect(find.text('MängelLog'), findsWidgets, reason: 'App-Name "MängelLog" fehlt');

    // Stats-Labels sichtbar (uppercase durch .toUpperCase() im Widget)
    expect(
      find.textContaining('GESAMT'),
      findsWidgets,
      reason: 'Stat "GESAMT" fehlt im Stats-Grid',
    );
    expect(
      find.textContaining('WOCHE'),
      findsWidgets,
      reason: 'Stat "WOCHE" fehlt im Stats-Grid',
    );

    // App-Farben prüfen via Theme
    final ctx = tester.element(find.byType(MaterialApp));
    final colorScheme = Theme.of(ctx).colorScheme;

    expect(
      colorScheme.primary.toARGB32(),
      equals(const Color(0xFFE8641A).toARGB32()),
      reason: 'Primary Color falsch: ${colorScheme.primary} — erwartet #E8641A',
    );
    expect(
      colorScheme.secondary.toARGB32(),
      equals(const Color(0xFF1A7A4E).toARGB32()),
      reason: 'Accent Color falsch: ${colorScheme.secondary} — erwartet #1A7A4E',
    );
    _info('Primary: ${colorScheme.primary} ✓  Accent: ${colorScheme.secondary} ✓');

    // "+" Button sichtbar
    expect(
      find.widgetWithText(ElevatedButton, 'Eintrag hinzufügen'),
      findsOneWidget,
      reason: 'Add-Button fehlt',
    );

    _pass('T03 — HomeScreen mit korrekten Farben und Stats-Grid');
  });

  // ── T04: Eintrag — Erstellen, Speichern, in Liste sichtbar ───────────────
  testWidgets('T04 | Eintrag — Erstellen und in Liste sichtbar', (tester) async {
    await _launchApp(tester, onboardingDone: true);

    // "Eintrag hinzufügen" tippen → Bottom Sheet öffnet sich
    await tester.tap(find.widgetWithText(ElevatedButton, 'Eintrag hinzufügen'));
    await tester.pumpAndSettle();

    // Formular-Header sichtbar (verwendet l.actionAdd.toUpperCase())
    expect(
      find.textContaining('EINTRAG HINZUFÜGEN'),
      findsOneWidget,
      reason: 'Bottom Sheet nicht geöffnet',
    );

    // Beschreibungs-Feld füllen
    const testText = 'Automatischer Test-Eintrag — Riss in Wand';
    final descField = find.byType(TextField).first;
    await tester.tap(descField);
    await tester.enterText(descField, testText);
    await tester.pumpAndSettle();

    // "Speichern" tippen
    await tester.tap(find.widgetWithText(ElevatedButton, 'Speichern'));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Eintrag in der Liste sichtbar
    expect(
      find.textContaining('Automatischer Test-Eintrag'),
      findsOneWidget,
      reason: 'Gespeicherter Eintrag nicht in der Verlaufsliste',
    );

    _pass('T04 — Eintrag erstellt und in Verlaufsliste sichtbar');
  });

  // ── T05: Verlaufsliste — Icons, chevron_right, Tap-Detail ────────────────
  testWidgets('T05 | Verlaufsliste — Einträge, Chevron, Detail-Screen', (tester) async {
    await _launchApp(tester, onboardingDone: true);

    // Einen Eintrag erstellen
    await tester.tap(find.widgetWithText(ElevatedButton, 'Eintrag hinzufügen'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, 'Listeneintrag Test');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Speichern'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Eintrag sichtbar
    expect(find.textContaining('Listeneintrag'), findsOneWidget);

    // Chevron-Icon vorhanden
    expect(
      find.byIcon(Icons.chevron_right),
      findsWidgets,
      reason: 'chevron_right Icons fehlen in der Liste',
    );

    // Detail-Screen öffnen
    await tester.tap(find.textContaining('Listeneintrag'));
    await tester.pumpAndSettle();

    // Detail-Screen Header "DETAILS"
    expect(
      find.textContaining('DETAILS'),
      findsOneWidget,
      reason: 'Detail-Screen nicht geöffnet',
    );

    // Löschen-Icon sichtbar
    expect(
      find.byIcon(Icons.delete_outline),
      findsOneWidget,
      reason: 'Löschen-Icon im Detail-Screen fehlt',
    );

    // Zurück navigieren
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    expect(find.text('MängelLog'), findsWidgets, reason: 'Zurück-Navigation fehlgeschlagen');

    _pass('T05 — Verlaufsliste mit Detail-Screen korrekt');
  });

  // ── T06: AdMob — App stabil, kein Crash ──────────────────────────────────
  testWidgets('T06 | AdMob — App stabil (Banner wird visuell geprüft)', (tester) async {
    await _launchApp(tester, onboardingDone: true, isPremium: false);

    // App läuft stabil — kein Crash
    expect(find.byType(MaterialApp), findsOneWidget, reason: 'App gecrasht nach AdMob-Init');

    // HomeScreen sichtbar
    expect(find.text('MängelLog'), findsWidgets);

    // 5 Sekunden warten (Banner benötigt ~30s auf echtem Gerät)
    await tester.pump(const Duration(seconds: 5));

    // Kein Crash nach Wartezeit
    expect(find.byType(MaterialApp), findsOneWidget);
    _info('AdMob-Banner benötigt ~30s auf echtem Gerät — visuell prüfen');

    _pass('T06 — App stabil mit AdMob (kein Crash)');
  });

  // ── T07: Download → Interstitial → Paywall ───────────────────────────────
  testWidgets('T07 | Paywall — Download-Button öffnet Paywall', (tester) async {
    await _launchApp(tester, onboardingDone: true, isPremium: false);

    // Download-Button tippen
    final downloadBtn = find.byIcon(Icons.download_outlined);
    expect(downloadBtn, findsOneWidget, reason: 'Download-Button nicht gefunden');
    await tester.tap(downloadBtn);
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Paywall-Screen muss geöffnet sein
    expect(
      find.textContaining('freischalten'),
      findsWidgets,
      reason: 'Paywall-Screen nicht geöffnet nach Download-Tap',
    );

    // "Preis wird geladen…" sichtbar (kein Play Store Produkt vorhanden)
    expect(
      find.text('Preis wird geladen…'),
      findsOneWidget,
      reason: '"Preis wird geladen…" fehlt — Billing nicht korrekt',
    );

    // Feature-Liste sichtbar
    expect(
      find.textContaining('PDF'),
      findsWidgets,
      reason: 'Feature-Liste in Paywall fehlt',
    );

    // Schließen-Button vorhanden (kein Crash beim Schließen)
    final closeBtn = find.byIcon(Icons.close);
    expect(closeBtn, findsOneWidget, reason: 'Schließen-Button in Paywall fehlt');
    await tester.tap(closeBtn);
    await tester.pumpAndSettle();
    expect(find.text('MängelLog'), findsWidgets, reason: 'Paywall-Schließen crashed die App');

    _pass('T07 — Paywall korrekt geöffnet und schließbar');
  });

  // ── T08: Settings — Impressum, Datenschutz, AGB WebViews ─────────────────
  testWidgets('T08 | Settings — Alle 3 WebViews öffnen', (tester) async {
    await _launchApp(tester, onboardingDone: true);

    // Settings öffnen
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Einstellungen'), findsOneWidget, reason: 'Settings nicht geöffnet');

    // Jedes Legal-Item testen
    final legalItems = <String>['Impressum', 'Datenschutz', 'AGB'];
    for (final item in legalItems) {
      await tester.tap(find.text(item));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // AppBar mit Zurück-Pfeil → bestätigt dass WebView-Screen geöffnet
      expect(
        find.byIcon(Icons.arrow_back_ios_new),
        findsOneWidget,
        reason: '$item WebView-Screen nicht geöffnet',
      );

      // Zurück
      await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
      await tester.pumpAndSettle();
      _info('$item WebView ✓');
    }

    _pass('T08 — Impressum, Datenschutz, AGB WebViews öffnen korrekt');
  });

  // ── T09: Eintrag löschen ─────────────────────────────────────────────────
  testWidgets('T09 | Eintrag — Löschen via Detail-Screen', (tester) async {
    await _launchApp(tester, onboardingDone: true);

    // Eintrag erstellen
    await tester.tap(find.widgetWithText(ElevatedButton, 'Eintrag hinzufügen'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, 'Zu löschender Test-Eintrag');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Speichern'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // In Detail-Screen navigieren
    await tester.tap(find.textContaining('Zu löschender'));
    await tester.pumpAndSettle();

    // Löschen antippen
    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pumpAndSettle();

    // Confirm-Dialog erscheint
    expect(find.text('Eintrag löschen?'), findsOneWidget, reason: 'Lösch-Dialog fehlt');

    // Bestätigen
    await tester.tap(find.text('Löschen'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Zurück auf HomeScreen, Eintrag weg
    expect(find.text('MängelLog'), findsWidgets);
    expect(
      find.textContaining('Zu löschender'),
      findsNothing,
      reason: 'Gelöschter Eintrag noch in Liste',
    );

    _pass('T09 — Eintrag löschen funktioniert korrekt');
  });

  // ── T10: Premium-Modus — Kein Download-Button zeigt Paywall ──────────────
  testWidgets('T10 | Premium — Download startet direkt PDF (kein Paywall)', (tester) async {
    await _launchApp(tester, onboardingDone: true, isPremium: true);

    // HomeScreen
    expect(find.text('MängelLog'), findsWidgets);

    // Download-Button tippen — bei Premium KEIN Paywall-Screen
    await tester.tap(find.byIcon(Icons.download_outlined));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Paywall darf NICHT erscheinen
    expect(
      find.textContaining('Preis wird geladen'),
      findsNothing,
      reason: 'Paywall erscheint obwohl isPremium=true',
    );

    _pass('T10 — Premium-Modus: Paywall wird korrekt übersprungen');
  });
}
