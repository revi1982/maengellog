// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'DefectLog';

  @override
  String get navHome => 'Overview';

  @override
  String get navHistory => 'History';

  @override
  String get navSettings => 'Settings';

  @override
  String get actionAdd => 'Add entry';

  @override
  String get actionSave => 'Save';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionEdit => 'Edit';

  @override
  String get actionExport => 'Export PDF';

  @override
  String get statTotal => 'Total';

  @override
  String get statThisWeek => 'This week';

  @override
  String get statLastEntry => 'Last entry';

  @override
  String get statMostCommon => 'Most common type';

  @override
  String get statEntries => 'Entries';

  @override
  String get noEntriesTitle => 'No entries yet';

  @override
  String get noEntriesSubtitle => 'Tap + to create the first entry';

  @override
  String get confirmDeleteTitle => 'Delete entry?';

  @override
  String get confirmDeleteMessage => 'This entry will be permanently deleted.';

  @override
  String get confirmDeleteConfirm => 'Delete';

  @override
  String get toastSaved => 'Saved';

  @override
  String get toastDeleted => 'Deleted';

  @override
  String get toastExportDone => 'PDF created';

  @override
  String get fieldDate => 'Date';

  @override
  String get fieldTime => 'Time';

  @override
  String get fieldDescription => 'Description';

  @override
  String get fieldDescriptionHint => 'What was found?';

  @override
  String get fieldPhoto => 'Add photo';

  @override
  String get fieldNotes => 'Notes';

  @override
  String get fieldNotesHint => 'Additional information…';

  @override
  String get fieldLocation => 'Location/Room';

  @override
  String get fieldLocationHint => 'e.g. Kitchen, Bathroom, Living room…';

  @override
  String get fieldWitnesses => 'Witnesses';

  @override
  String get fieldWitnessesHint => 'e.g. Previous tenant, building management…';

  @override
  String get fieldCategory => 'Category';

  @override
  String get fieldMeterReading => 'Meter reading';

  @override
  String get fieldMeterReadingHint => 'e.g. 12345 kWh';

  @override
  String get fieldKeyCount => 'Number of keys';

  @override
  String get categoryWall => 'Wall/Ceiling';

  @override
  String get categoryFloor => 'Floor';

  @override
  String get categoryWindow => 'Window/Door';

  @override
  String get categoryPlumbing => 'Plumbing';

  @override
  String get categoryElectric => 'Electrical';

  @override
  String get categoryOther => 'Other';

  @override
  String get sectionHistory => 'HISTORY';

  @override
  String get sectionStatistics => 'STATISTICS';

  @override
  String get sectionDetails => 'DETAILS';

  @override
  String get sectionPremium => 'PREMIUM';

  @override
  String get sectionLegal => 'LEGAL';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsImpressum => 'Imprint';

  @override
  String get settingsDatenschutz => 'Privacy Policy';

  @override
  String get settingsAgb => 'Terms of Service';

  @override
  String get settingsVersion => 'Version';

  @override
  String get settingsPurchase => 'Unlock Lifetime';

  @override
  String get settingsRestore => 'Restore Purchase';

  @override
  String get paywallTitle => 'Unlock Once';

  @override
  String get paywallSubtitle => 'PDF Export + Remove All Ads';

  @override
  String get paywallFeature1 => 'Professional PDF handover report';

  @override
  String get paywallFeature2 => 'No more ads';

  @override
  String get paywallFeature3 => 'One-time payment – no subscription';

  @override
  String get paywallFeature4 => 'Supports further development';

  @override
  String get paywallBuyButton => 'Unlock now';

  @override
  String get paywallRestoreButton => 'Already purchased';

  @override
  String get paywallLoadingPrice => 'Loading price…';

  @override
  String get paywallSuccess => 'Unlocked! Thank you.';

  @override
  String get paywallError => 'Purchase failed. Please try again.';

  @override
  String get onboardingNext => 'Next →';

  @override
  String get onboardingStart => 'Agree & Start →';

  @override
  String get onboardingPrivacyConsent => 'I agree to the Privacy Policy';

  @override
  String get onboardingPrivacyLink => 'Read Privacy Policy';

  @override
  String get onboardingPrivacyTitle => 'Privacy';

  @override
  String get onboardingPrivacyBody =>
      'This app stores all data exclusively on your device. No cloud, no account, no sharing.';

  @override
  String get onboardingHeadline0 => 'Deposit at risk?';

  @override
  String get onboardingBody0 =>
      'Missing documentation at move-out costs money. Track defects thoroughly – from day one.';

  @override
  String get onboardingHeadline1 => 'Everything documented';

  @override
  String get onboardingBody1 =>
      'Photos, timestamps, meter readings and room details – comprehensively recorded for when it matters.';

  @override
  String get onboardingHeadline2 => '100% Offline & Private';

  @override
  String get onboardingBody2 =>
      'No cloud. No account. All data stays on your device.';

  @override
  String get onboardingHeadline3 => 'PDF at the push of a button';

  @override
  String get onboardingBody3 =>
      'One click generates a professional handover report for your landlord or property management.';

  @override
  String get onboardingHeadline4 => 'Privacy';

  @override
  String get onboardingBody4 =>
      'This app stores all data exclusively on your device. No cloud, no account, no sharing.';

  @override
  String get permissionCameraAllow => 'Allow camera access';

  @override
  String get permissionDeny => 'Not now';

  @override
  String get pdfTitle => 'DefectLog – Handover Report';

  @override
  String get pdfCreatedAt => 'Created on';

  @override
  String get pdfTotalEntries => 'Total entries';

  @override
  String get pdfPage => 'Page';

  @override
  String get pdfOf => 'of';

  @override
  String get errorGeneral => 'Something went wrong.';

  @override
  String get errorTryAgain => 'Try again';
}
