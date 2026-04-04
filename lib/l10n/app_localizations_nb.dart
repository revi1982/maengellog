// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appName => 'DefectLog';

  @override
  String get navHome => 'Oversikt';

  @override
  String get navHistory => 'Historikk';

  @override
  String get navSettings => 'Innstillinger';

  @override
  String get actionAdd => 'Legg til oppføring';

  @override
  String get actionSave => 'Lagre';

  @override
  String get actionCancel => 'Avbryt';

  @override
  String get actionDelete => 'Slett';

  @override
  String get actionEdit => 'Rediger';

  @override
  String get actionExport => 'Eksporter PDF';

  @override
  String get statTotal => 'Totalt';

  @override
  String get statThisWeek => 'Denne uken';

  @override
  String get statLastEntry => 'Siste oppføring';

  @override
  String get statMostCommon => 'Vanligste type';

  @override
  String get statEntries => 'Oppføringer';

  @override
  String get noEntriesTitle => 'Ingen oppføringer ennå';

  @override
  String get noEntriesSubtitle =>
      'Trykk på + for å opprette den første oppføringen';

  @override
  String get confirmDeleteTitle => 'Slette oppføring?';

  @override
  String get confirmDeleteMessage => 'Denne oppføringen slettes permanent.';

  @override
  String get confirmDeleteConfirm => 'Slett';

  @override
  String get toastSaved => 'Lagret';

  @override
  String get toastDeleted => 'Slettet';

  @override
  String get toastExportDone => 'PDF opprettet';

  @override
  String get fieldDate => 'Dato';

  @override
  String get fieldTime => 'Klokkeslett';

  @override
  String get fieldDescription => 'Beskrivelse';

  @override
  String get fieldDescriptionHint => 'Hva ble konstatert?';

  @override
  String get fieldPhoto => 'Legg til bilde';

  @override
  String get fieldNotes => 'Notater';

  @override
  String get fieldNotesHint => 'Ytterligere informasjon…';

  @override
  String get fieldLocation => 'Sted / rom';

  @override
  String get fieldLocationHint => 'f.eks. Kjøkken, Bad, Stue…';

  @override
  String get fieldWitnesses => 'Vitner';

  @override
  String get fieldWitnessesHint =>
      'f.eks. Tidligere leietaker, Eiendomsforvalter…';

  @override
  String get fieldCategory => 'Kategori';

  @override
  String get fieldMeterReading => 'Målerstand';

  @override
  String get fieldMeterReadingHint => 'f.eks. 12345 kWh';

  @override
  String get fieldKeyCount => 'Antall nøkler';

  @override
  String get categoryWall => 'Vegg / Tak';

  @override
  String get categoryFloor => 'Gulv';

  @override
  String get categoryWindow => 'Vindu / Dør';

  @override
  String get categoryPlumbing => 'Rørlegger';

  @override
  String get categoryElectric => 'Elektrisk';

  @override
  String get categoryOther => 'Annet';

  @override
  String get sectionHistory => 'HISTORIKK';

  @override
  String get sectionStatistics => 'STATISTIKK';

  @override
  String get sectionDetails => 'DETALJER';

  @override
  String get sectionPremium => 'PREMIUM';

  @override
  String get sectionLegal => 'JURIDISK INFORMASJON';

  @override
  String get settingsTitle => 'Innstillinger';

  @override
  String get settingsImpressum => 'Impressum';

  @override
  String get settingsDatenschutz => 'Personvern';

  @override
  String get settingsAgb => 'Brukervilkår';

  @override
  String get settingsVersion => 'Versjon';

  @override
  String get settingsPurchase => 'Aktiver for livet';

  @override
  String get settingsRestore => 'Gjenopprett kjøp';

  @override
  String get settingsRepeatOnboarding => 'App-Einführung wiederholen';

  @override
  String get paywallTitle => 'Lås opp én gang';

  @override
  String get paywallSubtitle => 'PDF-eksport + ingen reklame';

  @override
  String get paywallFeature1 => 'Profesjonell PDF-overtakelsesrapport';

  @override
  String get paywallFeature2 => 'Ingen reklame lenger';

  @override
  String get paywallFeature3 => 'Engangsbetalng – ingen abonnement';

  @override
  String get paywallFeature4 => 'Du støtter videre utvikling';

  @override
  String get paywallBuyButton => 'Lås opp nå';

  @override
  String get paywallRestoreButton => 'Allerede kjøpt';

  @override
  String get paywallLoadingPrice => 'Pris lastes…';

  @override
  String get paywallSuccess => 'Låst opp! Takk.';

  @override
  String get paywallError => 'Kjøpet mislyktes. Prøv igjen.';

  @override
  String get onboardingNext => 'Neste →';

  @override
  String get onboardingStart => 'Godta og start →';

  @override
  String get onboardingPrivacyConsent => 'Jeg godtar personvernerklæringen';

  @override
  String get onboardingPrivacyLink => 'Les personvernerklæringen';

  @override
  String get onboardingPrivacyTitle => 'Personvern';

  @override
  String get onboardingPrivacyBody =>
      'Denne appen lagrer alle data utelukkende lokalt på enheten din. Ingen sky, ingen konto, ingen deling.';

  @override
  String get onboardingHeadline0 => 'Depositum i fare?';

  @override
  String get onboardingBody0 =>
      'Manglende dokumentasjon ved utflytting kan koste deg penger. Registrer feil systematisk – helt fra starten.';

  @override
  String get onboardingHeadline1 => 'Alt strukturert dokumentert';

  @override
  String get onboardingBody1 =>
      'Bilder, tidsstempler, målerstander og romopplysninger – alt omhyggelig registrert for enhver situasjon.';

  @override
  String get onboardingHeadline2 => '100 % frakoblet og privat';

  @override
  String get onboardingBody2 =>
      'Ingen sky. Ingen konto. Alle data forblir på enheten din.';

  @override
  String get onboardingHeadline3 => 'PDF med ett trykk';

  @override
  String get onboardingBody3 =>
      'Opprett en profesjonell overtakelsesrapport til utleier eller eiendomsforvalter med ett enkelt trykk.';

  @override
  String get onboardingHeadline4 => 'Personvern';

  @override
  String get onboardingBody4 =>
      'Denne appen lagrer alle data utelukkende lokalt på enheten din. Ingen sky, ingen konto, ingen deling.';

  @override
  String get permissionCameraAllow => 'Tillat kameratilgang';

  @override
  String get permissionDeny => 'Ikke nå';

  @override
  String get pdfTitle => 'DefectLog – Overtakelsesrapport';

  @override
  String get pdfCreatedAt => 'Opprettet';

  @override
  String get pdfTotalEntries => 'Oppføringer totalt';

  @override
  String get pdfPage => 'Side';

  @override
  String get pdfOf => 'av';

  @override
  String get errorGeneral => 'Noe gikk galt.';

  @override
  String get errorTryAgain => 'Prøv igjen';

  @override
  String get adRewardButton => 'Se annonse';

  @override
  String get adRewardSuccess => 'Banner skjult i 24 t.';

  @override
  String get adRewardNotAvailable => 'Ingen annonse tilgjengelig.';
}
