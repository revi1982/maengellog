// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appName => 'DefectLog';

  @override
  String get navHome => 'Početna';

  @override
  String get navHistory => 'Povijest';

  @override
  String get navSettings => 'Postavke';

  @override
  String get actionAdd => 'Dodaj';

  @override
  String get actionSave => 'Spremi';

  @override
  String get actionCancel => 'Odustani';

  @override
  String get actionDelete => 'Obriši';

  @override
  String get actionEdit => 'Uredi';

  @override
  String get actionExport => 'Izvezi';

  @override
  String get statTotal => 'Ukupno';

  @override
  String get statThisWeek => 'Ovaj tjedan';

  @override
  String get statLastEntry => 'Zadnji unos';

  @override
  String get statMostCommon => 'Najčešće';

  @override
  String get statEntries => 'Unosi';

  @override
  String get noEntriesTitle => 'Nema unosa';

  @override
  String get noEntriesSubtitle => 'Dodajte prvi defekt dodirom na gumb +';

  @override
  String get confirmDeleteTitle => 'Obrisati unos?';

  @override
  String get confirmDeleteMessage => 'Ova radnja ne može se poništiti.';

  @override
  String get confirmDeleteConfirm => 'Obriši';

  @override
  String get toastSaved => 'Spremljeno';

  @override
  String get toastDeleted => 'Obrisano';

  @override
  String get toastExportDone => 'Izvoz završen';

  @override
  String get fieldDate => 'Datum';

  @override
  String get fieldTime => 'Vrijeme';

  @override
  String get fieldDescription => 'Opis defekta';

  @override
  String get fieldDescriptionHint => 'Opišite defekt što preciznije';

  @override
  String get fieldPhoto => 'Fotografija';

  @override
  String get fieldNotes => 'Bilješke';

  @override
  String get fieldNotesHint => 'Dodatne bilješke (neobavezno)';

  @override
  String get fieldLocation => 'Lokacija';

  @override
  String get fieldLocationHint => 'Npr. dnevna soba, kupaonica';

  @override
  String get fieldWitnesses => 'Svjedoci';

  @override
  String get fieldWitnessesHint => 'Imena svjedoka (neobavezno)';

  @override
  String get fieldCategory => 'Kategorija';

  @override
  String get fieldMeterReading => 'Očitanje mjerača';

  @override
  String get fieldMeterReadingHint => 'Npr. 12345 kWh';

  @override
  String get fieldKeyCount => 'Broj ključeva';

  @override
  String get categoryWall => 'Zid / Strop';

  @override
  String get categoryFloor => 'Pod';

  @override
  String get categoryWindow => 'Prozor / Vrata';

  @override
  String get categoryPlumbing => 'Vodoinstalacije';

  @override
  String get categoryElectric => 'Elektrika';

  @override
  String get categoryOther => 'Ostalo';

  @override
  String get sectionHistory => 'Povijest';

  @override
  String get sectionStatistics => 'Statistike';

  @override
  String get sectionDetails => 'Detalji';

  @override
  String get sectionPremium => 'Premium';

  @override
  String get sectionLegal => 'Pravne informacije';

  @override
  String get settingsTitle => 'Postavke';

  @override
  String get settingsImpressum => 'Impressum';

  @override
  String get settingsDatenschutz => 'Zaštita podataka';

  @override
  String get settingsAgb => 'Opći uvjeti poslovanja';

  @override
  String get settingsVersion => 'Verzija';

  @override
  String get settingsPurchase => 'Otključaj Premium';

  @override
  String get settingsRestore => 'Vrati kupnju';

  @override
  String get settingsRepeatOnboarding => 'App-Einführung wiederholen';

  @override
  String get paywallTitle => 'Otključaj jednom';

  @override
  String get paywallSubtitle => 'Jednokratno plaćanje – bez pretplate';

  @override
  String get paywallFeature1 => 'Neograničeni PDF izvoz';

  @override
  String get paywallFeature2 => 'Bez reklama';

  @override
  String get paywallFeature3 => 'Sve buduće funkcije uključene';

  @override
  String get paywallFeature4 => 'Podržite razvoj aplikacije';

  @override
  String get paywallBuyButton => 'Kupi sada';

  @override
  String get paywallRestoreButton => 'Vrati kupnju';

  @override
  String get paywallLoadingPrice => 'Učitavanje cijene…';

  @override
  String get paywallSuccess => 'Premium aktiviran. Hvala!';

  @override
  String get paywallError => 'Kupnja nije uspjela. Pokušajte ponovo.';

  @override
  String get onboardingNext => 'Dalje';

  @override
  String get onboardingStart => 'Početak';

  @override
  String get onboardingPrivacyConsent => 'Prihvaćam politiku privatnosti';

  @override
  String get onboardingPrivacyLink => 'Pogledaj politiku privatnosti';

  @override
  String get onboardingPrivacyTitle => 'Vaši podaci su sigurni';

  @override
  String get onboardingPrivacyBody =>
      'Svi podaci pohranjeni su samo na vašem uređaju. Bez oblaka, bez računa, bez dijeljenja.';

  @override
  String get onboardingHeadline0 => 'Kaucija u opasnosti?';

  @override
  String get onboardingBody0 =>
      'DefectLog vam pomaže strukturirano dokumentirati defekte pri predaji stana.';

  @override
  String get onboardingHeadline1 => 'Fotografirajte i opisujte';

  @override
  String get onboardingBody1 =>
      'Svaki defekt zabilježite s fotografijom, lokacijom i preciznim opisom.';

  @override
  String get onboardingHeadline2 => 'Sve na jednom mjestu';

  @override
  String get onboardingBody2 =>
      'Pregledna povijest svih defekata uvijek pri ruci.';

  @override
  String get onboardingHeadline3 => 'Izvoz kao PDF';

  @override
  String get onboardingBody3 =>
      'Stvorite profesionalni zapisnik o predaji kao PDF – jednim dodirom.';

  @override
  String get onboardingHeadline4 => 'Vaši podaci su vaši';

  @override
  String get onboardingBody4 =>
      'Podaci se pohranjuju samo lokalno. Bez oblaka, bez pretplate.';

  @override
  String get permissionCameraAllow => 'Dopusti pristup kameri';

  @override
  String get permissionDeny => 'Ne, hvala';

  @override
  String get pdfTitle => 'DefectLog – Zapisnik o predaji';

  @override
  String get pdfCreatedAt => 'Kreirano';

  @override
  String get pdfTotalEntries => 'Ukupan broj defekata';

  @override
  String get pdfPage => 'Stranica';

  @override
  String get pdfOf => 'od';

  @override
  String get errorGeneral => 'Došlo je do greške';

  @override
  String get errorTryAgain => 'Pokušajte ponovo';

  @override
  String get adRewardButton => 'Pogledaj oglas';

  @override
  String get adRewardSuccess => 'Banner skriven 24 h.';

  @override
  String get adRewardNotAvailable => 'Nema dostupnog oglasa.';
}
