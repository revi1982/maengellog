import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ─── Datenmodell ─────────────────────────────────────────────────────────────

class LegalSection {
  final String? heading;
  final String  body;
  const LegalSection({this.heading, required this.body});

  factory LegalSection.fromJson(Map<String, dynamic> j) => LegalSection(
        heading: j['heading'] as String?,
        body:    j['body']    as String? ?? '',
      );
}

// ─── Service ──────────────────────────────────────────────────────────────────

class LegalService {
  static const _url       = 'https://reivi.de/app-legal.json';
  static const _cacheKey  = 'legal_json_cache';
  static const _cacheTime = 'legal_json_cache_ts';
  static const _ttl       = Duration(hours: 24);

  /// Gibt die Sektionen für [key] zurück ('impressum'|'datenschutz'|'agb').
  /// Reihenfolge: Remote (wenn Cache abgelaufen) → Cache → Hardcode-Fallback
  static Future<List<LegalSection>> getSections(String key) async {
    final prefs = await SharedPreferences.getInstance();

    // Cache-Alter prüfen
    final ts        = prefs.getInt(_cacheTime) ?? 0;
    final cacheAge  = DateTime.now().millisecondsSinceEpoch - ts;
    final cacheStale = cacheAge > _ttl.inMilliseconds;

    // 1. Netzwerk versuchen wenn Cache abgelaufen (mit 8s Timeout)
    if (cacheStale) {
      try {
        final response = await http
            .get(Uri.parse(_url))
            .timeout(const Duration(seconds: 8));

        if (response.statusCode == 200) {
          final raw = response.body;
          await prefs.setString(_cacheKey, raw);
          await prefs.setInt(_cacheTime, DateTime.now().millisecondsSinceEpoch);
          return _parse(raw, key);
        }
      } catch (_) {
        // Kein Netz → weiter zu Cache
      }
    }

    // 2. Cache verwenden (frisch oder abgelaufen aber noch vorhanden)
    final cached = prefs.getString(_cacheKey);
    if (cached != null) {
      try {
        return _parse(cached, key);
      } catch (_) {}
    }

    // 3. Hardcode-Fallback (immer aktuelle Kontaktdaten)
    return _fallback(key);
  }

  static List<LegalSection> _parse(String raw, String key) {
    final json = jsonDecode(raw) as Map<String, dynamic>;
    final list = json[key] as List<dynamic>? ?? [];
    return list
        .map((e) => LegalSection.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // ─── Fallback-Texte (werden nur verwendet wenn reivi.de nicht erreichbar) ──

  static List<LegalSection> _fallback(String key) {
    switch (key) {
      case 'impressum':
        return const [
          LegalSection(
            heading: 'Angaben gemäß § 5 TMG',
            body: 'Viktor Reinik\nReiVi Apps\nDeutschland',
          ),
          LegalSection(
            heading: 'Kontakt',
            body: 'E-Mail: revi@online.de\nWebsite: https://reivi.de',
          ),
          LegalSection(
            heading: 'Verantwortlich für den Inhalt',
            body: 'Viktor Reinik\nrevi@online.de',
          ),
          LegalSection(
            heading: 'Hinweis zur App',
            body:
                'Diese App dient der persönlichen Dokumentation. Alle '
                'Daten werden ausschließlich lokal auf deinem Gerät '
                'gespeichert. Es findet keine Übertragung an externe '
                'Server statt.',
          ),
          LegalSection(
            heading: 'Haftungsausschluss',
            body:
                'Die Inhalte dieser App wurden mit größter Sorgfalt '
                'erstellt. Für die Richtigkeit, Vollständigkeit und '
                'Aktualität der Inhalte übernehmen wir keine Gewähr. '
                'Die App ersetzt keine rechtliche oder fachliche '
                'Beratung.',
          ),
        ];

      case 'datenschutz':
        return const [
          LegalSection(
            heading: 'Verantwortlicher',
            body: 'Viktor Reinik · revi@online.de',
          ),
          LegalSection(
            heading: 'Lokale Datenspeicherung',
            body:
                'Alle eingegebenen Daten (Fotos, Texte, Zeitstempel) '
                'werden ausschließlich lokal auf deinem Gerät gespeichert '
                'und nicht an externe Server übertragen.',
          ),
          LegalSection(
            heading: 'Kein Tracking, keine Konten',
            body:
                'Diese App erfordert keine Registrierung und verwendet '
                'kein Nutzer-Tracking.',
          ),
          LegalSection(
            heading: 'Werbung (AdMob)',
            body:
                'In der kostenlosen Version werden Anzeigen von Google '
                'AdMob eingeblendet. Dabei können technische Daten '
                'übertragen werden. Weitere Informationen: '
                'https://policies.google.com/privacy',
          ),
          LegalSection(
            heading: 'In-App-Kauf (Google Play)',
            body:
                'Käufe werden über Google Play Billing abgewickelt. '
                'Dabei gelten die Datenschutzbestimmungen von Google.',
          ),
          LegalSection(
            heading: 'Deine Rechte',
            body:
                'Du hast das Recht auf Auskunft, Berichtigung und '
                'Löschung deiner Daten. Da alle Daten lokal gespeichert '
                'werden, kannst du sie jederzeit durch Deinstallation '
                'der App löschen.',
          ),
          LegalSection(
            heading: 'Kontakt',
            body: 'revi@online.de',
          ),
        ];

      case 'agb':
      default:
        return const [
          LegalSection(
            heading: 'Geltungsbereich',
            body:
                'Diese Nutzungsbedingungen gelten für die Verwendung '
                'der App MängelLog.',
          ),
          LegalSection(
            heading: 'Leistungsumfang',
            body:
                'Die App ermöglicht die strukturierte Dokumentation von '
                'Wohnungsmängeln. Die kostenlose Version enthält Werbung.',
          ),
          LegalSection(
            heading: 'Premium-Funktion',
            body:
                'Der PDF-Export ist eine kostenpflichtige Einmalfunktion '
                '(Lifetime). Kein Abonnement. Der Preis wird im App Store '
                'angezeigt.',
          ),
          LegalSection(
            heading: 'Haftungsbeschränkung',
            body:
                'Die App dient ausschließlich der persönlichen '
                'Dokumentation. Wir übernehmen keine Haftung für '
                'Vollständigkeit oder rechtliche Verwertbarkeit der '
                'erstellten Dokumente.',
          ),
          LegalSection(
            heading: 'Änderungen',
            body:
                'Wir behalten uns vor, diese Bedingungen jederzeit zu '
                'ändern. Aktuelle Fassung: reivi.de/agb',
          ),
          LegalSection(
            heading: 'Anwendbares Recht',
            body: 'Es gilt deutsches Recht.',
          ),
          LegalSection(
            heading: 'Kontakt',
            body: 'revi@online.de',
          ),
        ];
    }
  }
}
