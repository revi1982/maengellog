// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'MängelLog';

  @override
  String get navHome => 'Übersicht';

  @override
  String get navHistory => 'Verlauf';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String get actionAdd => 'Eintrag hinzufügen';

  @override
  String get actionSave => 'Speichern';

  @override
  String get actionCancel => 'Abbrechen';

  @override
  String get actionDelete => 'Löschen';

  @override
  String get actionEdit => 'Bearbeiten';

  @override
  String get actionExport => 'PDF exportieren';

  @override
  String get statTotal => 'Gesamt';

  @override
  String get statThisWeek => 'Diese Woche';

  @override
  String get statLastEntry => 'Letzter Eintrag';

  @override
  String get statMostCommon => 'Häufigster Typ';

  @override
  String get statEntries => 'Einträge';

  @override
  String get noEntriesTitle => 'Noch keine Einträge';

  @override
  String get noEntriesSubtitle =>
      'Tippe auf + um den ersten Eintrag zu erstellen';

  @override
  String get confirmDeleteTitle => 'Eintrag löschen?';

  @override
  String get confirmDeleteMessage => 'Dieser Eintrag wird dauerhaft gelöscht.';

  @override
  String get confirmDeleteConfirm => 'Löschen';

  @override
  String get toastSaved => 'Gespeichert';

  @override
  String get toastDeleted => 'Gelöscht';

  @override
  String get toastExportDone => 'PDF erstellt';

  @override
  String get fieldDate => 'Datum';

  @override
  String get fieldTime => 'Uhrzeit';

  @override
  String get fieldDescription => 'Beschreibung';

  @override
  String get fieldDescriptionHint => 'Was wurde festgestellt?';

  @override
  String get fieldPhoto => 'Foto hinzufügen';

  @override
  String get fieldNotes => 'Notizen';

  @override
  String get fieldNotesHint => 'Weitere Angaben…';

  @override
  String get fieldLocation => 'Ort/Raum';

  @override
  String get fieldLocationHint => 'z.B. Küche, Bad, Wohnzimmer…';

  @override
  String get fieldWitnesses => 'Zeugen';

  @override
  String get fieldWitnessesHint => 'z.B. Vormieter, Hausverwaltung…';

  @override
  String get fieldCategory => 'Kategorie';

  @override
  String get fieldMeterReading => 'Zählerstand';

  @override
  String get fieldMeterReadingHint => 'z.B. 12345 kWh';

  @override
  String get fieldKeyCount => 'Anzahl Schlüssel';

  @override
  String get categoryWall => 'Wand/Decke';

  @override
  String get categoryFloor => 'Boden';

  @override
  String get categoryWindow => 'Fenster/Tür';

  @override
  String get categoryPlumbing => 'Sanitär';

  @override
  String get categoryElectric => 'Elektrik';

  @override
  String get categoryOther => 'Sonstiges';

  @override
  String get sectionHistory => 'VERLAUF';

  @override
  String get sectionStatistics => 'STATISTIK';

  @override
  String get sectionDetails => 'DETAILS';

  @override
  String get sectionPremium => 'PREMIUM';

  @override
  String get sectionLegal => 'RECHTLICHES';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsImpressum => 'Impressum';

  @override
  String get settingsDatenschutz => 'Datenschutz';

  @override
  String get settingsAgb => 'AGB';

  @override
  String get settingsVersion => 'Version';

  @override
  String get settingsPurchase => 'Lifetime freischalten';

  @override
  String get settingsRestore => 'Kauf wiederherstellen';

  @override
  String get settingsRepeatOnboarding => 'App-Einführung wiederholen';

  @override
  String get paywallTitle => 'Einmalig freischalten';

  @override
  String get paywallSubtitle => 'PDF-Export + Alle Werbung weg';

  @override
  String get paywallFeature1 => 'Professionelles PDF-Übergabeprotokoll';

  @override
  String get paywallFeature2 => 'Keine Werbung mehr';

  @override
  String get paywallFeature3 => 'Einmalige Zahlung – kein Abo';

  @override
  String get paywallFeature4 => 'Unterstützt die Weiterentwicklung';

  @override
  String get paywallBuyButton => 'Jetzt freischalten';

  @override
  String get paywallRestoreButton => 'Bereits gekauft';

  @override
  String get paywallLoadingPrice => 'Preis wird geladen…';

  @override
  String get paywallSuccess => 'Freigeschaltet! Danke.';

  @override
  String get paywallError => 'Kauf fehlgeschlagen. Versuche es erneut.';

  @override
  String get onboardingNext => 'Weiter →';

  @override
  String get onboardingStart => 'Einverstanden & Starten →';

  @override
  String get onboardingPrivacyConsent =>
      'Ich stimme der Datenschutzerklärung zu';

  @override
  String get onboardingPrivacyLink => 'Datenschutzerklärung lesen';

  @override
  String get onboardingPrivacyTitle => 'Datenschutz';

  @override
  String get onboardingPrivacyBody =>
      'Diese App speichert alle Daten ausschließlich lokal auf deinem Gerät. Keine Cloud, kein Account, keine Weitergabe.';

  @override
  String get onboardingHeadline0 => 'Kaution in Gefahr?';

  @override
  String get onboardingBody0 =>
      'Fehlende Belege beim Auszug kosten bares Geld. Halte Mängel lückenlos fest – von Anfang an.';

  @override
  String get onboardingHeadline1 => 'Alles strukturiert dokumentiert';

  @override
  String get onboardingBody1 =>
      'Fotos, Zeitstempel, Zählerstand und Raumangabe – lückenlos festgehalten für den Ernstfall.';

  @override
  String get onboardingHeadline2 => '100% Offline & Privat';

  @override
  String get onboardingBody2 =>
      'Keine Cloud. Kein Account. Alle Daten bleiben auf deinem Gerät.';

  @override
  String get onboardingHeadline3 => 'PDF auf Knopfdruck';

  @override
  String get onboardingBody3 =>
      'Mit einem Klick ein professionelles Übergabeprotokoll für Vermieter oder Hausverwaltung.';

  @override
  String get onboardingHeadline4 => 'Datenschutz';

  @override
  String get onboardingBody4 =>
      'Diese App speichert alle Daten ausschließlich lokal auf deinem Gerät. Keine Cloud, kein Account, keine Weitergabe.';

  @override
  String get permissionCameraAllow => 'Kamerazugriff erlauben';

  @override
  String get permissionDeny => 'Nicht jetzt';

  @override
  String get pdfTitle => 'MängelLog – Übergabeprotokoll';

  @override
  String get pdfCreatedAt => 'Erstellt am';

  @override
  String get pdfTotalEntries => 'Einträge gesamt';

  @override
  String get pdfPage => 'Seite';

  @override
  String get pdfOf => 'von';

  @override
  String get errorGeneral => 'Etwas ist schiefgelaufen.';

  @override
  String get errorTryAgain => 'Erneut versuchen';

  @override
  String get adRewardButton => 'Werbung ansehen';

  @override
  String get adRewardSuccess => 'Banner 2h ausgeblendet.';

  @override
  String get adRewardNotAvailable => 'Keine Werbung verfügbar.';
}
