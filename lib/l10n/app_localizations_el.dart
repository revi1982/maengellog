// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appName => 'DefectLog';

  @override
  String get navHome => 'Επισκόπηση';

  @override
  String get navHistory => 'Ιστορικό';

  @override
  String get navSettings => 'Ρυθμίσεις';

  @override
  String get actionAdd => 'Προσθήκη καταχώρησης';

  @override
  String get actionSave => 'Αποθήκευση';

  @override
  String get actionCancel => 'Άκυρο';

  @override
  String get actionDelete => 'Διαγραφή';

  @override
  String get actionEdit => 'Επεξεργασία';

  @override
  String get actionExport => 'Εξαγωγή PDF';

  @override
  String get statTotal => 'Σύνολο';

  @override
  String get statThisWeek => 'Αυτή την εβδομάδα';

  @override
  String get statLastEntry => 'Τελευταία καταχώρηση';

  @override
  String get statMostCommon => 'Συχνότερος τύπος';

  @override
  String get statEntries => 'Καταχωρήσεις';

  @override
  String get noEntriesTitle => 'Δεν υπάρχουν καταχωρήσεις';

  @override
  String get noEntriesSubtitle =>
      'Πατήστε + για να δημιουργήσετε την πρώτη καταχώρηση';

  @override
  String get confirmDeleteTitle => 'Διαγραφή καταχώρησης;';

  @override
  String get confirmDeleteMessage => 'Αυτή η καταχώρηση θα διαγραφεί οριστικά.';

  @override
  String get confirmDeleteConfirm => 'Διαγραφή';

  @override
  String get toastSaved => 'Αποθηκεύτηκε';

  @override
  String get toastDeleted => 'Διαγράφηκε';

  @override
  String get toastExportDone => 'Το PDF δημιουργήθηκε';

  @override
  String get fieldDate => 'Ημερομηνία';

  @override
  String get fieldTime => 'Ώρα';

  @override
  String get fieldDescription => 'Περιγραφή';

  @override
  String get fieldDescriptionHint => 'Τι διαπιστώθηκε;';

  @override
  String get fieldPhoto => 'Προσθήκη φωτογραφίας';

  @override
  String get fieldNotes => 'Σημειώσεις';

  @override
  String get fieldNotesHint => 'Πρόσθετες πληροφορίες…';

  @override
  String get fieldLocation => 'Τοποθεσία / χώρος';

  @override
  String get fieldLocationHint => 'π.χ. Κουζίνα, Μπάνιο, Σαλόνι…';

  @override
  String get fieldWitnesses => 'Μάρτυρες';

  @override
  String get fieldWitnessesHint =>
      'π.χ. Προηγούμενος ενοικιαστής, Διαχειριστής…';

  @override
  String get fieldCategory => 'Κατηγορία';

  @override
  String get fieldMeterReading => 'Ένδειξη μετρητή';

  @override
  String get fieldMeterReadingHint => 'π.χ. 12345 kWh';

  @override
  String get fieldKeyCount => 'Αριθμός κλειδιών';

  @override
  String get categoryWall => 'Τοίχος / Οροφή';

  @override
  String get categoryFloor => 'Δάπεδο';

  @override
  String get categoryWindow => 'Παράθυρο / Πόρτα';

  @override
  String get categoryPlumbing => 'Υδραυλικά';

  @override
  String get categoryElectric => 'Ηλεκτρικά';

  @override
  String get categoryOther => 'Άλλο';

  @override
  String get sectionHistory => 'ΙΣΤΟΡΙΚΟ';

  @override
  String get sectionStatistics => 'ΣΤΑΤΙΣΤΙΚΑ';

  @override
  String get sectionDetails => 'ΛΕΠΤΟΜΕΡΕΙΕΣ';

  @override
  String get sectionPremium => 'PREMIUM';

  @override
  String get sectionLegal => 'ΝΟΜΙΚΕΣ ΠΛΗΡΟΦΟΡΙΕΣ';

  @override
  String get settingsTitle => 'Ρυθμίσεις';

  @override
  String get settingsImpressum => 'Impressum';

  @override
  String get settingsDatenschutz => 'Απόρρητο';

  @override
  String get settingsAgb => 'Όροι χρήσης';

  @override
  String get settingsVersion => 'Έκδοση';

  @override
  String get settingsPurchase => 'Ενεργοποίηση εφ\' όρου ζωής';

  @override
  String get settingsRestore => 'Επαναφορά αγοράς';

  @override
  String get paywallTitle => 'Ξεκλείδωμα μία φορά';

  @override
  String get paywallSubtitle => 'Εξαγωγή PDF + χωρίς διαφημίσεις';

  @override
  String get paywallFeature1 => 'Επαγγελματικό πρωτόκολλο παράδοσης σε PDF';

  @override
  String get paywallFeature2 => 'Καμία διαφήμιση πια';

  @override
  String get paywallFeature3 => 'Εφάπαξ πληρωμή – χωρίς συνδρομή';

  @override
  String get paywallFeature4 => 'Υποστηρίζετε τη συνεχή ανάπτυξη';

  @override
  String get paywallBuyButton => 'Ξεκλείδωμα τώρα';

  @override
  String get paywallRestoreButton => 'Ήδη αγορασμένο';

  @override
  String get paywallLoadingPrice => 'Φόρτωση τιμής…';

  @override
  String get paywallSuccess => 'Ξεκλειδώθηκε! Ευχαριστώ.';

  @override
  String get paywallError => 'Η αγορά απέτυχε. Δοκιμάστε ξανά.';

  @override
  String get onboardingNext => 'Επόμενο →';

  @override
  String get onboardingStart => 'Αποδέχομαι και ξεκινώ →';

  @override
  String get onboardingPrivacyConsent => 'Αποδέχομαι την πολιτική απορρήτου';

  @override
  String get onboardingPrivacyLink => 'Διαβάστε την πολιτική απορρήτου';

  @override
  String get onboardingPrivacyTitle => 'Απόρρητο';

  @override
  String get onboardingPrivacyBody =>
      'Αυτή η εφαρμογή αποθηκεύει όλα τα δεδομένα αποκλειστικά τοπικά στη συσκευή σας. Δεν υπάρχει σύννεφο, λογαριασμός ή κοινοποίηση.';

  @override
  String get onboardingHeadline0 => 'Εγγύηση σε κίνδυνο;';

  @override
  String get onboardingBody0 =>
      'Η έλλειψη αποδείξεων κατά την αποχώρηση κοστίζει πραγματικά χρήματα. Καταγράφετε βλάβες συστηματικά – από την αρχή.';

  @override
  String get onboardingHeadline1 => 'Όλα δομημένα τεκμηριωμένα';

  @override
  String get onboardingBody1 =>
      'Φωτογραφίες, χρονοσφραγίδες, ενδείξεις μετρητών και στοιχεία χώρου – όλα καταγεγραμμένα για κάθε ενδεχόμενο.';

  @override
  String get onboardingHeadline2 => '100% εκτός σύνδεσης και ιδιωτικά';

  @override
  String get onboardingBody2 =>
      'Χωρίς σύννεφο. Χωρίς λογαριασμό. Όλα τα δεδομένα παραμένουν στη συσκευή σας.';

  @override
  String get onboardingHeadline3 => 'PDF με ένα άγγιγμα';

  @override
  String get onboardingBody3 =>
      'Δημιουργήστε επαγγελματικό πρωτόκολλο παράδοσης για τον ιδιοκτήτη ή τον διαχειριστή με ένα μόνο άγγιγμα.';

  @override
  String get onboardingHeadline4 => 'Απόρρητο';

  @override
  String get onboardingBody4 =>
      'Αυτή η εφαρμογή αποθηκεύει όλα τα δεδομένα αποκλειστικά τοπικά στη συσκευή σας. Δεν υπάρχει σύννεφο, λογαριασμός ή κοινοποίηση.';

  @override
  String get permissionCameraAllow => 'Να επιτρέπεται η πρόσβαση στην κάμερα';

  @override
  String get permissionDeny => 'Όχι τώρα';

  @override
  String get pdfTitle => 'DefectLog – Πρωτόκολλο παράδοσης';

  @override
  String get pdfCreatedAt => 'Δημιουργήθηκε';

  @override
  String get pdfTotalEntries => 'Καταχωρήσεις σύνολο';

  @override
  String get pdfPage => 'Σελίδα';

  @override
  String get pdfOf => 'από';

  @override
  String get errorGeneral => 'Κάτι πήγε στραβά.';

  @override
  String get errorTryAgain => 'Δοκιμάστε ξανά';
}
