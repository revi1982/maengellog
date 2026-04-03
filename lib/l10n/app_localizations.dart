import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_et.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_lv.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('ar'),
    Locale('bg'),
    Locale('cs'),
    Locale('da'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('et'),
    Locale('fi'),
    Locale('fr'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('lt'),
    Locale('lv'),
    Locale('nb'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sl'),
    Locale('sv'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('zh')
  ];

  /// No description provided for @appName.
  ///
  /// In de, this message translates to:
  /// **'MängelLog'**
  String get appName;

  /// No description provided for @navHome.
  ///
  /// In de, this message translates to:
  /// **'Übersicht'**
  String get navHome;

  /// No description provided for @navHistory.
  ///
  /// In de, this message translates to:
  /// **'Verlauf'**
  String get navHistory;

  /// No description provided for @navSettings.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen'**
  String get navSettings;

  /// No description provided for @actionAdd.
  ///
  /// In de, this message translates to:
  /// **'Eintrag hinzufügen'**
  String get actionAdd;

  /// No description provided for @actionSave.
  ///
  /// In de, this message translates to:
  /// **'Speichern'**
  String get actionSave;

  /// No description provided for @actionCancel.
  ///
  /// In de, this message translates to:
  /// **'Abbrechen'**
  String get actionCancel;

  /// No description provided for @actionDelete.
  ///
  /// In de, this message translates to:
  /// **'Löschen'**
  String get actionDelete;

  /// No description provided for @actionEdit.
  ///
  /// In de, this message translates to:
  /// **'Bearbeiten'**
  String get actionEdit;

  /// No description provided for @actionExport.
  ///
  /// In de, this message translates to:
  /// **'PDF exportieren'**
  String get actionExport;

  /// No description provided for @statTotal.
  ///
  /// In de, this message translates to:
  /// **'Gesamt'**
  String get statTotal;

  /// No description provided for @statThisWeek.
  ///
  /// In de, this message translates to:
  /// **'Diese Woche'**
  String get statThisWeek;

  /// No description provided for @statLastEntry.
  ///
  /// In de, this message translates to:
  /// **'Letzter Eintrag'**
  String get statLastEntry;

  /// No description provided for @statMostCommon.
  ///
  /// In de, this message translates to:
  /// **'Häufigster Typ'**
  String get statMostCommon;

  /// No description provided for @statEntries.
  ///
  /// In de, this message translates to:
  /// **'Einträge'**
  String get statEntries;

  /// No description provided for @noEntriesTitle.
  ///
  /// In de, this message translates to:
  /// **'Noch keine Einträge'**
  String get noEntriesTitle;

  /// No description provided for @noEntriesSubtitle.
  ///
  /// In de, this message translates to:
  /// **'Tippe auf + um den ersten Eintrag zu erstellen'**
  String get noEntriesSubtitle;

  /// No description provided for @confirmDeleteTitle.
  ///
  /// In de, this message translates to:
  /// **'Eintrag löschen?'**
  String get confirmDeleteTitle;

  /// No description provided for @confirmDeleteMessage.
  ///
  /// In de, this message translates to:
  /// **'Dieser Eintrag wird dauerhaft gelöscht.'**
  String get confirmDeleteMessage;

  /// No description provided for @confirmDeleteConfirm.
  ///
  /// In de, this message translates to:
  /// **'Löschen'**
  String get confirmDeleteConfirm;

  /// No description provided for @toastSaved.
  ///
  /// In de, this message translates to:
  /// **'Gespeichert'**
  String get toastSaved;

  /// No description provided for @toastDeleted.
  ///
  /// In de, this message translates to:
  /// **'Gelöscht'**
  String get toastDeleted;

  /// No description provided for @toastExportDone.
  ///
  /// In de, this message translates to:
  /// **'PDF erstellt'**
  String get toastExportDone;

  /// No description provided for @fieldDate.
  ///
  /// In de, this message translates to:
  /// **'Datum'**
  String get fieldDate;

  /// No description provided for @fieldTime.
  ///
  /// In de, this message translates to:
  /// **'Uhrzeit'**
  String get fieldTime;

  /// No description provided for @fieldDescription.
  ///
  /// In de, this message translates to:
  /// **'Beschreibung'**
  String get fieldDescription;

  /// No description provided for @fieldDescriptionHint.
  ///
  /// In de, this message translates to:
  /// **'Was wurde festgestellt?'**
  String get fieldDescriptionHint;

  /// No description provided for @fieldPhoto.
  ///
  /// In de, this message translates to:
  /// **'Foto hinzufügen'**
  String get fieldPhoto;

  /// No description provided for @fieldNotes.
  ///
  /// In de, this message translates to:
  /// **'Notizen'**
  String get fieldNotes;

  /// No description provided for @fieldNotesHint.
  ///
  /// In de, this message translates to:
  /// **'Weitere Angaben…'**
  String get fieldNotesHint;

  /// No description provided for @fieldLocation.
  ///
  /// In de, this message translates to:
  /// **'Ort/Raum'**
  String get fieldLocation;

  /// No description provided for @fieldLocationHint.
  ///
  /// In de, this message translates to:
  /// **'z.B. Küche, Bad, Wohnzimmer…'**
  String get fieldLocationHint;

  /// No description provided for @fieldWitnesses.
  ///
  /// In de, this message translates to:
  /// **'Zeugen'**
  String get fieldWitnesses;

  /// No description provided for @fieldWitnessesHint.
  ///
  /// In de, this message translates to:
  /// **'z.B. Vormieter, Hausverwaltung…'**
  String get fieldWitnessesHint;

  /// No description provided for @fieldCategory.
  ///
  /// In de, this message translates to:
  /// **'Kategorie'**
  String get fieldCategory;

  /// No description provided for @fieldMeterReading.
  ///
  /// In de, this message translates to:
  /// **'Zählerstand'**
  String get fieldMeterReading;

  /// No description provided for @fieldMeterReadingHint.
  ///
  /// In de, this message translates to:
  /// **'z.B. 12345 kWh'**
  String get fieldMeterReadingHint;

  /// No description provided for @fieldKeyCount.
  ///
  /// In de, this message translates to:
  /// **'Anzahl Schlüssel'**
  String get fieldKeyCount;

  /// No description provided for @categoryWall.
  ///
  /// In de, this message translates to:
  /// **'Wand/Decke'**
  String get categoryWall;

  /// No description provided for @categoryFloor.
  ///
  /// In de, this message translates to:
  /// **'Boden'**
  String get categoryFloor;

  /// No description provided for @categoryWindow.
  ///
  /// In de, this message translates to:
  /// **'Fenster/Tür'**
  String get categoryWindow;

  /// No description provided for @categoryPlumbing.
  ///
  /// In de, this message translates to:
  /// **'Sanitär'**
  String get categoryPlumbing;

  /// No description provided for @categoryElectric.
  ///
  /// In de, this message translates to:
  /// **'Elektrik'**
  String get categoryElectric;

  /// No description provided for @categoryOther.
  ///
  /// In de, this message translates to:
  /// **'Sonstiges'**
  String get categoryOther;

  /// No description provided for @sectionHistory.
  ///
  /// In de, this message translates to:
  /// **'VERLAUF'**
  String get sectionHistory;

  /// No description provided for @sectionStatistics.
  ///
  /// In de, this message translates to:
  /// **'STATISTIK'**
  String get sectionStatistics;

  /// No description provided for @sectionDetails.
  ///
  /// In de, this message translates to:
  /// **'DETAILS'**
  String get sectionDetails;

  /// No description provided for @sectionPremium.
  ///
  /// In de, this message translates to:
  /// **'PREMIUM'**
  String get sectionPremium;

  /// No description provided for @sectionLegal.
  ///
  /// In de, this message translates to:
  /// **'RECHTLICHES'**
  String get sectionLegal;

  /// No description provided for @settingsTitle.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen'**
  String get settingsTitle;

  /// No description provided for @settingsImpressum.
  ///
  /// In de, this message translates to:
  /// **'Impressum'**
  String get settingsImpressum;

  /// No description provided for @settingsDatenschutz.
  ///
  /// In de, this message translates to:
  /// **'Datenschutz'**
  String get settingsDatenschutz;

  /// No description provided for @settingsAgb.
  ///
  /// In de, this message translates to:
  /// **'AGB'**
  String get settingsAgb;

  /// No description provided for @settingsVersion.
  ///
  /// In de, this message translates to:
  /// **'Version'**
  String get settingsVersion;

  /// No description provided for @settingsPurchase.
  ///
  /// In de, this message translates to:
  /// **'Lifetime freischalten'**
  String get settingsPurchase;

  /// No description provided for @settingsRestore.
  ///
  /// In de, this message translates to:
  /// **'Kauf wiederherstellen'**
  String get settingsRestore;

  /// No description provided for @paywallTitle.
  ///
  /// In de, this message translates to:
  /// **'Einmalig freischalten'**
  String get paywallTitle;

  /// No description provided for @paywallSubtitle.
  ///
  /// In de, this message translates to:
  /// **'PDF-Export + Alle Werbung weg'**
  String get paywallSubtitle;

  /// No description provided for @paywallFeature1.
  ///
  /// In de, this message translates to:
  /// **'Professionelles PDF-Übergabeprotokoll'**
  String get paywallFeature1;

  /// No description provided for @paywallFeature2.
  ///
  /// In de, this message translates to:
  /// **'Keine Werbung mehr'**
  String get paywallFeature2;

  /// No description provided for @paywallFeature3.
  ///
  /// In de, this message translates to:
  /// **'Einmalige Zahlung – kein Abo'**
  String get paywallFeature3;

  /// No description provided for @paywallFeature4.
  ///
  /// In de, this message translates to:
  /// **'Unterstützt die Weiterentwicklung'**
  String get paywallFeature4;

  /// No description provided for @paywallBuyButton.
  ///
  /// In de, this message translates to:
  /// **'Jetzt freischalten'**
  String get paywallBuyButton;

  /// No description provided for @paywallRestoreButton.
  ///
  /// In de, this message translates to:
  /// **'Bereits gekauft'**
  String get paywallRestoreButton;

  /// No description provided for @paywallLoadingPrice.
  ///
  /// In de, this message translates to:
  /// **'Preis wird geladen…'**
  String get paywallLoadingPrice;

  /// No description provided for @paywallSuccess.
  ///
  /// In de, this message translates to:
  /// **'Freigeschaltet! Danke.'**
  String get paywallSuccess;

  /// No description provided for @paywallError.
  ///
  /// In de, this message translates to:
  /// **'Kauf fehlgeschlagen. Versuche es erneut.'**
  String get paywallError;

  /// No description provided for @onboardingNext.
  ///
  /// In de, this message translates to:
  /// **'Weiter →'**
  String get onboardingNext;

  /// No description provided for @onboardingStart.
  ///
  /// In de, this message translates to:
  /// **'Einverstanden & Starten →'**
  String get onboardingStart;

  /// No description provided for @onboardingPrivacyConsent.
  ///
  /// In de, this message translates to:
  /// **'Ich stimme der Datenschutzerklärung zu'**
  String get onboardingPrivacyConsent;

  /// No description provided for @onboardingPrivacyLink.
  ///
  /// In de, this message translates to:
  /// **'Datenschutzerklärung lesen'**
  String get onboardingPrivacyLink;

  /// No description provided for @onboardingPrivacyTitle.
  ///
  /// In de, this message translates to:
  /// **'Datenschutz'**
  String get onboardingPrivacyTitle;

  /// No description provided for @onboardingPrivacyBody.
  ///
  /// In de, this message translates to:
  /// **'Diese App speichert alle Daten ausschließlich lokal auf deinem Gerät. Keine Cloud, kein Account, keine Weitergabe.'**
  String get onboardingPrivacyBody;

  /// No description provided for @onboardingHeadline0.
  ///
  /// In de, this message translates to:
  /// **'Kaution in Gefahr?'**
  String get onboardingHeadline0;

  /// No description provided for @onboardingBody0.
  ///
  /// In de, this message translates to:
  /// **'Fehlende Belege beim Auszug kosten bares Geld. Halte Mängel lückenlos fest – von Anfang an.'**
  String get onboardingBody0;

  /// No description provided for @onboardingHeadline1.
  ///
  /// In de, this message translates to:
  /// **'Alles strukturiert dokumentiert'**
  String get onboardingHeadline1;

  /// No description provided for @onboardingBody1.
  ///
  /// In de, this message translates to:
  /// **'Fotos, Zeitstempel, Zählerstand und Raumangabe – lückenlos festgehalten für den Ernstfall.'**
  String get onboardingBody1;

  /// No description provided for @onboardingHeadline2.
  ///
  /// In de, this message translates to:
  /// **'100% Offline & Privat'**
  String get onboardingHeadline2;

  /// No description provided for @onboardingBody2.
  ///
  /// In de, this message translates to:
  /// **'Keine Cloud. Kein Account. Alle Daten bleiben auf deinem Gerät.'**
  String get onboardingBody2;

  /// No description provided for @onboardingHeadline3.
  ///
  /// In de, this message translates to:
  /// **'PDF auf Knopfdruck'**
  String get onboardingHeadline3;

  /// No description provided for @onboardingBody3.
  ///
  /// In de, this message translates to:
  /// **'Mit einem Klick ein professionelles Übergabeprotokoll für Vermieter oder Hausverwaltung.'**
  String get onboardingBody3;

  /// No description provided for @onboardingHeadline4.
  ///
  /// In de, this message translates to:
  /// **'Datenschutz'**
  String get onboardingHeadline4;

  /// No description provided for @onboardingBody4.
  ///
  /// In de, this message translates to:
  /// **'Diese App speichert alle Daten ausschließlich lokal auf deinem Gerät. Keine Cloud, kein Account, keine Weitergabe.'**
  String get onboardingBody4;

  /// No description provided for @permissionCameraAllow.
  ///
  /// In de, this message translates to:
  /// **'Kamerazugriff erlauben'**
  String get permissionCameraAllow;

  /// No description provided for @permissionDeny.
  ///
  /// In de, this message translates to:
  /// **'Nicht jetzt'**
  String get permissionDeny;

  /// No description provided for @pdfTitle.
  ///
  /// In de, this message translates to:
  /// **'MängelLog – Übergabeprotokoll'**
  String get pdfTitle;

  /// No description provided for @pdfCreatedAt.
  ///
  /// In de, this message translates to:
  /// **'Erstellt am'**
  String get pdfCreatedAt;

  /// No description provided for @pdfTotalEntries.
  ///
  /// In de, this message translates to:
  /// **'Einträge gesamt'**
  String get pdfTotalEntries;

  /// No description provided for @pdfPage.
  ///
  /// In de, this message translates to:
  /// **'Seite'**
  String get pdfPage;

  /// No description provided for @pdfOf.
  ///
  /// In de, this message translates to:
  /// **'von'**
  String get pdfOf;

  /// No description provided for @errorGeneral.
  ///
  /// In de, this message translates to:
  /// **'Etwas ist schiefgelaufen.'**
  String get errorGeneral;

  /// No description provided for @errorTryAgain.
  ///
  /// In de, this message translates to:
  /// **'Erneut versuchen'**
  String get errorTryAgain;

  /// No description provided for @adRewardButton.
  ///
  /// In de, this message translates to:
  /// **'Werbung ansehen'**
  String get adRewardButton;

  /// No description provided for @adRewardSuccess.
  ///
  /// In de, this message translates to:
  /// **'Banner 24h ausgeblendet.'**
  String get adRewardSuccess;

  /// No description provided for @adRewardNotAvailable.
  ///
  /// In de, this message translates to:
  /// **'Keine Werbung verfügbar.'**
  String get adRewardNotAvailable;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'bg',
        'cs',
        'da',
        'de',
        'el',
        'en',
        'es',
        'et',
        'fi',
        'fr',
        'hi',
        'hr',
        'hu',
        'id',
        'it',
        'ja',
        'ko',
        'lt',
        'lv',
        'nb',
        'nl',
        'pl',
        'pt',
        'ro',
        'ru',
        'sk',
        'sl',
        'sv',
        'th',
        'tr',
        'uk',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bg':
      return AppLocalizationsBg();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'et':
      return AppLocalizationsEt();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'lt':
      return AppLocalizationsLt();
    case 'lv':
      return AppLocalizationsLv();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sv':
      return AppLocalizationsSv();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
