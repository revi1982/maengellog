// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get appName => 'DefectLog';

  @override
  String get navHome => 'Ülevaade';

  @override
  String get navHistory => 'Ajalugu';

  @override
  String get navSettings => 'Seaded';

  @override
  String get actionAdd => 'Lisa kirje';

  @override
  String get actionSave => 'Salvesta';

  @override
  String get actionCancel => 'Tühista';

  @override
  String get actionDelete => 'Kustuta';

  @override
  String get actionEdit => 'Muuda';

  @override
  String get actionExport => 'Ekspordi PDF';

  @override
  String get statTotal => 'Kokku';

  @override
  String get statThisWeek => 'Sel nädalal';

  @override
  String get statLastEntry => 'Viimane kirje';

  @override
  String get statMostCommon => 'Sagedasim tüüp';

  @override
  String get statEntries => 'Kirjed';

  @override
  String get noEntriesTitle => 'Kirjeid veel pole';

  @override
  String get noEntriesSubtitle => 'Vajuta +, et luua esimene kirje';

  @override
  String get confirmDeleteTitle => 'Kustuta kirje?';

  @override
  String get confirmDeleteMessage => 'See kirje kustutatakse jäädavalt.';

  @override
  String get confirmDeleteConfirm => 'Kustuta';

  @override
  String get toastSaved => 'Salvestatud';

  @override
  String get toastDeleted => 'Kustutatud';

  @override
  String get toastExportDone => 'PDF loodud';

  @override
  String get fieldDate => 'Kuupäev';

  @override
  String get fieldTime => 'Kellaaeg';

  @override
  String get fieldDescription => 'Kirjeldus';

  @override
  String get fieldDescriptionHint => 'Mida tuvastati?';

  @override
  String get fieldPhoto => 'Lisa foto';

  @override
  String get fieldNotes => 'Märkmed';

  @override
  String get fieldNotesHint => 'Lisateave…';

  @override
  String get fieldLocation => 'Asukoht / ruum';

  @override
  String get fieldLocationHint => 'nt Köök, Vannituba, Elutuba…';

  @override
  String get fieldWitnesses => 'Tunnistajad';

  @override
  String get fieldWitnessesHint => 'nt Eelmine üürnik, Majavalitsus…';

  @override
  String get fieldCategory => 'Kategooria';

  @override
  String get fieldMeterReading => 'Mõõdiku näit';

  @override
  String get fieldMeterReadingHint => 'nt 12345 kWh';

  @override
  String get fieldKeyCount => 'Võtmete arv';

  @override
  String get categoryWall => 'Sein / Lagi';

  @override
  String get categoryFloor => 'Põrand';

  @override
  String get categoryWindow => 'Aken / Uks';

  @override
  String get categoryPlumbing => 'Sanitaartehnika';

  @override
  String get categoryElectric => 'Elekter';

  @override
  String get categoryOther => 'Muu';

  @override
  String get sectionHistory => 'AJALUGU';

  @override
  String get sectionStatistics => 'STATISTIKA';

  @override
  String get sectionDetails => 'ÜKSIKASJAD';

  @override
  String get sectionPremium => 'PREMIUM';

  @override
  String get sectionLegal => 'ÕIGUSLIK TEAVE';

  @override
  String get settingsTitle => 'Seaded';

  @override
  String get settingsImpressum => 'Impressum';

  @override
  String get settingsDatenschutz => 'Privaatsus';

  @override
  String get settingsAgb => 'Kasutustingimused';

  @override
  String get settingsVersion => 'Versioon';

  @override
  String get settingsPurchase => 'Aktiveeri eluajaks';

  @override
  String get settingsRestore => 'Taasta ost';

  @override
  String get settingsRepeatOnboarding => 'App-Einführung wiederholen';

  @override
  String get paywallTitle => 'Ava ühe korra';

  @override
  String get paywallSubtitle => 'PDF-eksport + reklaamid kaovad';

  @override
  String get paywallFeature1 => 'Professionaalne PDF üleandmisprotokolli';

  @override
  String get paywallFeature2 => 'Enam reklaame';

  @override
  String get paywallFeature3 => 'Ühekordne makse – tellimuseta';

  @override
  String get paywallFeature4 => 'Toetad edasist arendust';

  @override
  String get paywallBuyButton => 'Ava kohe';

  @override
  String get paywallRestoreButton => 'Juba ostetud';

  @override
  String get paywallLoadingPrice => 'Hinda laetakse…';

  @override
  String get paywallSuccess => 'Avatud! Tänan.';

  @override
  String get paywallError => 'Ost ebaõnnestus. Proovi uuesti.';

  @override
  String get onboardingNext => 'Edasi →';

  @override
  String get onboardingStart => 'Nõustun ja alusta →';

  @override
  String get onboardingPrivacyConsent => 'Nõustun privaatsuspoliitikaga';

  @override
  String get onboardingPrivacyLink => 'Loe privaatsuspoliitikat';

  @override
  String get onboardingPrivacyTitle => 'Privaatsus';

  @override
  String get onboardingPrivacyBody =>
      'See rakendus salvestab kõik andmed ainult teie seadmesse. Pilv puudub, kontot pole, andmeid ei jagata.';

  @override
  String get onboardingHeadline0 => 'Tagatisraha ohus?';

  @override
  String get onboardingBody0 =>
      'Puuduvad tõendid väljumisel maksavad päris raha. Dokumendi puudused süstemaatiliselt – kohe algusest peale.';

  @override
  String get onboardingHeadline1 => 'Kõik struktureeritult dokumenteeritud';

  @override
  String get onboardingBody1 =>
      'Fotod, ajatemplid, mõõdiku näidud ja ruumi tähistus – kõik talletatud hädajuhuks.';

  @override
  String get onboardingHeadline2 => '100% võrguühenduseta ja privaatselt';

  @override
  String get onboardingBody2 =>
      'Pilve pole. Kontot pole. Kõik andmed jäävad teie seadmesse.';

  @override
  String get onboardingHeadline3 => 'PDF ühe nupuvajutusega';

  @override
  String get onboardingBody3 =>
      'Ühe klõpsuga professionaalne üleandmisprotokoll üürileandja või majavalitsuse jaoks.';

  @override
  String get onboardingHeadline4 => 'Privaatsus';

  @override
  String get onboardingBody4 =>
      'See rakendus salvestab kõik andmed ainult teie seadmesse. Pilv puudub, kontot pole, andmeid ei jagata.';

  @override
  String get permissionCameraAllow => 'Luba kaamera kasutamine';

  @override
  String get permissionDeny => 'Mitte praegu';

  @override
  String get pdfTitle => 'DefectLog – Üleandmisprotokoll';

  @override
  String get pdfCreatedAt => 'Loodud';

  @override
  String get pdfTotalEntries => 'Kirjeid kokku';

  @override
  String get pdfPage => 'Lehekülg';

  @override
  String get pdfOf => '/';

  @override
  String get errorGeneral => 'Midagi läks valesti.';

  @override
  String get errorTryAgain => 'Proovi uuesti';

  @override
  String get adRewardButton => 'Vaata reklaami';

  @override
  String get adRewardSuccess => 'Banner peidetud 24 tunniks.';

  @override
  String get adRewardNotAvailable => 'Reklaami pole saadaval.';
}
