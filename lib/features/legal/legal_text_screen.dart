import 'package:flutter/material.dart';

// ── Datenmodell ───────────────────────────────────────────────────────────────
class LegalSection {
  final String? heading;
  final String body;
  const LegalSection({this.heading, required this.body});
}

// ── Fertige Legal-Inhalte ─────────────────────────────────────────────────────
class LegalContent {
  // ── Impressum ──────────────────────────────────────────────────────────────
  static const List<LegalSection> impressum = [
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
          'Diese App dient der persönlichen Dokumentation. Alle Daten werden ausschließlich lokal auf deinem Gerät gespeichert. Es findet keine Übertragung an externe Server statt.',
    ),
    LegalSection(
      heading: 'Haftungsausschluss',
      body:
          'Die Inhalte dieser App wurden mit größter Sorgfalt erstellt. Für die Richtigkeit, Vollständigkeit und Aktualität der Inhalte übernehmen wir keine Gewähr. Die App ersetzt keine rechtliche oder fachliche Beratung.',
    ),
  ];

  // ── Datenschutzerklärung ───────────────────────────────────────────────────
  static const List<LegalSection> datenschutz = [
    LegalSection(
      heading: '1. Verantwortlicher',
      body: 'Viktor Reinik\nrevi@online.de\nhttps://reivi.de',
    ),
    LegalSection(
      heading: '2. Lokale Datenspeicherung',
      body:
          'Diese App speichert alle Daten ausschließlich lokal auf deinem Gerät (SQLite-Datenbank). Es werden keine personenbezogenen Daten an externe Server, Clouds oder Dritte übertragen.\n\nDu behältst jederzeit die volle Kontrolle über deine Daten. Beim Deinstallieren der App werden alle Daten unwiderruflich gelöscht.',
    ),
    LegalSection(
      heading: '3. Kein Tracking, kein Analytics',
      body:
          'Wir verwenden keine Tracking-Tools, kein Web-Analytics und kein automatisiertes Nutzerverhalten-Monitoring.',
    ),
    LegalSection(
      heading: '4. Werbung (kostenlose Version)',
      body:
          'Die kostenlose Version enthält Werbeanzeigen von Google AdMob (Google LLC). AdMob kann gerätebezogene Daten wie die Werbe-ID (Advertising ID) verwenden, um personalisierte Werbung auszuspielen.\n\nMehr Informationen: https://policies.google.com/privacy\n\nMit dem einmaligen Kauf des Premium-Upgrades werden alle Werbeanzeigen dauerhaft entfernt.',
    ),
    LegalSection(
      heading: '5. In-App-Käufe',
      body:
          'Käufe werden über den Google Play Store (Google LLC) abgewickelt. ReiVi hat keinen Zugriff auf deine Zahlungsdaten. Es gelten die Datenschutzrichtlinien von Google.\n\nEs gibt ausschließlich Einmalzahlungen – kein Abo, keine wiederkehrenden Kosten.',
    ),
    LegalSection(
      heading: '6. Kamera-Zugriff',
      body:
          'Die App fordert Kamera-Zugriff nur dann an, wenn du ein Foto aufnehmen möchtest. Fotos werden lokal auf deinem Gerät gespeichert und nicht übertragen.',
    ),
    LegalSection(
      heading: '7. Deine Rechte',
      body:
          'Da wir keine personenbezogenen Daten erheben oder speichern, entfallen klassische DSGVO-Auskunfts- und Löschansprüche gegenüber uns. Deine Daten liegen ausschließlich auf deinem Gerät.',
    ),
    LegalSection(
      heading: '8. Kontakt',
      body: 'Viktor Reinik\nrevi@online.de',
    ),
  ];

  // ── Allgemeine Geschäftsbedingungen ────────────────────────────────────────
  static const List<LegalSection> agb = [
    LegalSection(
      heading: '1. Geltungsbereich',
      body:
          'Diese Allgemeinen Geschäftsbedingungen (AGB) gelten für die Nutzung der App MängelLog, entwickelt von Viktor Reinik (ReiVi Apps).',
    ),
    LegalSection(
      heading: '2. Leistungsumfang',
      body:
          'MängelLog ist eine App zur strukturierten, lokalen Dokumentation von Wohnungsmängeln und Übergaben. Sie dient als persönliches Hilfsmittel – nicht als Rechts- oder Fachberatung.\n\nDie kostenlose Version umfasst unbegrenzte Einträge mit Foto, Zeitstempel und Zählerstand. Die kostenpflichtige Premium-Version bietet zusätzlich den PDF-Export.',
    ),
    LegalSection(
      heading: '3. Premium-Funktion & Kauf',
      body:
          'Der PDF-Export ist als Einmalikauf erhältlich. Es gibt kein Abo und keine Folgekosten. Der Preis wird live aus dem Google Play Store geladen und vor dem Kauf angezeigt.\n\nKäufe sind nach Aktivierung im Google Play Store gültig und können über „Kauf wiederherstellen" in der App reaktiviert werden.',
    ),
    LegalSection(
      heading: '4. Haftungsausschluss',
      body:
          'Die App dient der persönlichen Dokumentation und lückenlosem Festhalten von Zuständen. Sie ersetzt keine rechtliche oder fachliche Beratung und stellt keine rechtliche Beweisurkunde dar.\n\nFür Schäden, die aus der Nutzung oder Nicht-Nutzung der App entstehen, haftet ReiVi nicht.',
    ),
    LegalSection(
      heading: '5. Verfügbarkeit',
      body:
          'Da alle Daten lokal gespeichert werden, ist die App vollständig offline nutzbar. Wir übernehmen keine Garantie für ununterbrochene Verfügbarkeit, da dies von deinem Gerät abhängt.',
    ),
    LegalSection(
      heading: '6. Änderungen',
      body:
          'Diese AGB können jederzeit geändert werden. Die aktuelle Version ist stets in der App abrufbar.',
    ),
    LegalSection(
      heading: '7. Anwendbares Recht',
      body: 'Es gilt das Recht der Bundesrepublik Deutschland.',
    ),
    LegalSection(
      heading: '8. Kontakt',
      body: 'Viktor Reinik\nrevi@online.de\nhttps://reivi.de',
    ),
  ];
}

// ── Screen ────────────────────────────────────────────────────────────────────
class LegalTextScreen extends StatelessWidget {
  final String title;
  final List<LegalSection> sections;

  const LegalTextScreen({
    super.key,
    required this.title,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F5FA),
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
        itemCount: sections.length,
        itemBuilder: (_, i) => _SectionCard(
          section: sections[i],
          primary: primary,
          isFirst: i == 0,
        ),
      ),
    );
  }
}

// ── Sektion-Karte ─────────────────────────────────────────────────────────────
class _SectionCard extends StatelessWidget {
  final LegalSection section;
  final Color primary;
  final bool isFirst;

  const _SectionCard({
    required this.section,
    required this.primary,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: isFirst ? 0 : 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (section.heading != null) ...[
              Text(
                section.heading!,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                  color: primary,
                ),
              ),
              const SizedBox(height: 6),
            ],
            Text(
              section.body,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF374151),
                height: 1.55,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
