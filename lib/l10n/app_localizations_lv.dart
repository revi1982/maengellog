// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class AppLocalizationsLv extends AppLocalizations {
  AppLocalizationsLv([String locale = 'lv']) : super(locale);

  @override
  String get appName => 'DefectLog';

  @override
  String get navHome => 'Pārskats';

  @override
  String get navHistory => 'Vēsture';

  @override
  String get navSettings => 'Iestatījumi';

  @override
  String get actionAdd => 'Pievienot ierakstu';

  @override
  String get actionSave => 'Saglabāt';

  @override
  String get actionCancel => 'Atcelt';

  @override
  String get actionDelete => 'Dzēst';

  @override
  String get actionEdit => 'Rediģēt';

  @override
  String get actionExport => 'Eksportēt PDF';

  @override
  String get statTotal => 'Kopā';

  @override
  String get statThisWeek => 'Šajā nedēļā';

  @override
  String get statLastEntry => 'Pēdējais ieraksts';

  @override
  String get statMostCommon => 'Biežākais veids';

  @override
  String get statEntries => 'Ieraksti';

  @override
  String get noEntriesTitle => 'Ierakstu vēl nav';

  @override
  String get noEntriesSubtitle => 'Nospiediet +, lai izveidotu pirmo ierakstu';

  @override
  String get confirmDeleteTitle => 'Dzēst ierakstu?';

  @override
  String get confirmDeleteMessage =>
      'Šis ieraksts tiks neatgriezeniski dzēsts.';

  @override
  String get confirmDeleteConfirm => 'Dzēst';

  @override
  String get toastSaved => 'Saglabāts';

  @override
  String get toastDeleted => 'Dzēsts';

  @override
  String get toastExportDone => 'PDF izveidots';

  @override
  String get fieldDate => 'Datums';

  @override
  String get fieldTime => 'Laiks';

  @override
  String get fieldDescription => 'Apraksts';

  @override
  String get fieldDescriptionHint => 'Kas tika konstatēts?';

  @override
  String get fieldPhoto => 'Pievienot fotoattēlu';

  @override
  String get fieldNotes => 'Piezīmes';

  @override
  String get fieldNotesHint => 'Papildu informācija…';

  @override
  String get fieldLocation => 'Vieta / telpa';

  @override
  String get fieldLocationHint => 'piem., Virtuve, Vannas istaba, Viesistaba…';

  @override
  String get fieldWitnesses => 'Liecinieki';

  @override
  String get fieldWitnessesHint =>
      'piem., Iepriekšējais īrnieks, Namu pārvalde…';

  @override
  String get fieldCategory => 'Kategorija';

  @override
  String get fieldMeterReading => 'Skaitītāja rādījums';

  @override
  String get fieldMeterReadingHint => 'piem., 12345 kWh';

  @override
  String get fieldKeyCount => 'Atslēgu skaits';

  @override
  String get categoryWall => 'Siena / Griesti';

  @override
  String get categoryFloor => 'Grīda';

  @override
  String get categoryWindow => 'Logs / Durvis';

  @override
  String get categoryPlumbing => 'Santehnika';

  @override
  String get categoryElectric => 'Elektrika';

  @override
  String get categoryOther => 'Cits';

  @override
  String get sectionHistory => 'VĒSTURE';

  @override
  String get sectionStatistics => 'STATISTIKA';

  @override
  String get sectionDetails => 'DETAĻAS';

  @override
  String get sectionPremium => 'PREMIUM';

  @override
  String get sectionLegal => 'JURIDISKĀ INFORMĀCIJA';

  @override
  String get settingsTitle => 'Iestatījumi';

  @override
  String get settingsImpressum => 'Impressum';

  @override
  String get settingsDatenschutz => 'Privātums';

  @override
  String get settingsAgb => 'Lietošanas noteikumi';

  @override
  String get settingsVersion => 'Versija';

  @override
  String get settingsPurchase => 'Aktivizēt uz mūžu';

  @override
  String get settingsRestore => 'Atjaunot pirkumu';

  @override
  String get paywallTitle => 'Atbloķēt vienreiz';

  @override
  String get paywallSubtitle => 'PDF eksports + nekādas reklāmas';

  @override
  String get paywallFeature1 => 'Profesionāls PDF nodošanas protokols';

  @override
  String get paywallFeature2 => 'Nekādas reklāmas';

  @override
  String get paywallFeature3 => 'Vienreizējs maksājums – bez abonēšanas';

  @override
  String get paywallFeature4 => 'Atbalstāt tālāko izstrādi';

  @override
  String get paywallBuyButton => 'Atbloķēt tagad';

  @override
  String get paywallRestoreButton => 'Jau iegādāts';

  @override
  String get paywallLoadingPrice => 'Cena tiek ielādēta…';

  @override
  String get paywallSuccess => 'Atbloķēts! Paldies.';

  @override
  String get paywallError => 'Pirkums neizdevās. Mēģiniet vēlreiz.';

  @override
  String get onboardingNext => 'Tālāk →';

  @override
  String get onboardingStart => 'Piekrītu un sāku →';

  @override
  String get onboardingPrivacyConsent => 'Piekrītu privātuma politikai';

  @override
  String get onboardingPrivacyLink => 'Lasīt privātuma politiku';

  @override
  String get onboardingPrivacyTitle => 'Privātums';

  @override
  String get onboardingPrivacyBody =>
      'Šī lietotne visus datus glabā tikai jūsu ierīcē. Nekāda mākoņa, nekāda konta, nekādas kopīgošanas.';

  @override
  String get onboardingHeadline0 => 'Draudeklis apdraudēts?';

  @override
  String get onboardingBody0 =>
      'Trūkstoši pierādījumi izceļošanas brīdī maksā īstus naudu. Sistemātiski fiksējiet defektus – jau no paša sākuma.';

  @override
  String get onboardingHeadline1 => 'Viss strukturēti dokumentēts';

  @override
  String get onboardingBody1 =>
      'Fotoattēli, laikspiedogi, skaitītāja rādījumi un telpas norāde – viss fiksēts ārkārtas gadījumam.';

  @override
  String get onboardingHeadline2 => '100% bezsaistē un privāti';

  @override
  String get onboardingBody2 =>
      'Nekāda mākoņa. Nekāda konta. Visi dati paliek jūsu ierīcē.';

  @override
  String get onboardingHeadline3 => 'PDF ar vienu klikšķi';

  @override
  String get onboardingBody3 =>
      'Ar vienu klikšķi izveidojiet profesionālu nodošanas protokolu īpašniekam vai namu pārvaldei.';

  @override
  String get onboardingHeadline4 => 'Privātums';

  @override
  String get onboardingBody4 =>
      'Šī lietotne visus datus glabā tikai jūsu ierīcē. Nekāda mākoņa, nekāda konta, nekādas kopīgošanas.';

  @override
  String get permissionCameraAllow => 'Atļaut piekļuvi kamerai';

  @override
  String get permissionDeny => 'Ne tagad';

  @override
  String get pdfTitle => 'DefectLog – Nodošanas protokols';

  @override
  String get pdfCreatedAt => 'Izveidots';

  @override
  String get pdfTotalEntries => 'Ieraksti kopā';

  @override
  String get pdfPage => 'Lappuse';

  @override
  String get pdfOf => 'no';

  @override
  String get errorGeneral => 'Kaut kas nogāja greizi.';

  @override
  String get errorTryAgain => 'Mēģināt vēlreiz';
}
