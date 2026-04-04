// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appName => 'DefectLog';

  @override
  String get navHome => 'Főoldal';

  @override
  String get navHistory => 'Előzmények';

  @override
  String get navSettings => 'Beállítások';

  @override
  String get actionAdd => 'Hozzáadás';

  @override
  String get actionSave => 'Mentés';

  @override
  String get actionCancel => 'Mégse';

  @override
  String get actionDelete => 'Törlés';

  @override
  String get actionEdit => 'Szerkesztés';

  @override
  String get actionExport => 'Exportálás';

  @override
  String get statTotal => 'Összesen';

  @override
  String get statThisWeek => 'Ezen a héten';

  @override
  String get statLastEntry => 'Utolsó bejegyzés';

  @override
  String get statMostCommon => 'Leggyakoribb';

  @override
  String get statEntries => 'Bejegyzések';

  @override
  String get noEntriesTitle => 'Nincs bejegyzés';

  @override
  String get noEntriesSubtitle =>
      'Adja hozzá az első hibát a + gomb megérintésével';

  @override
  String get confirmDeleteTitle => 'Törli a bejegyzést?';

  @override
  String get confirmDeleteMessage => 'Ez a művelet nem vonható vissza.';

  @override
  String get confirmDeleteConfirm => 'Törlés';

  @override
  String get toastSaved => 'Mentve';

  @override
  String get toastDeleted => 'Törölve';

  @override
  String get toastExportDone => 'Export kész';

  @override
  String get fieldDate => 'Dátum';

  @override
  String get fieldTime => 'Időpont';

  @override
  String get fieldDescription => 'Hiba leírása';

  @override
  String get fieldDescriptionHint =>
      'Írja le a hibát a lehető legrészletesebben';

  @override
  String get fieldPhoto => 'Fénykép';

  @override
  String get fieldNotes => 'Megjegyzések';

  @override
  String get fieldNotesHint => 'További megjegyzések (opcionális)';

  @override
  String get fieldLocation => 'Helyszín';

  @override
  String get fieldLocationHint => 'Pl. nappali, fürdőszoba';

  @override
  String get fieldWitnesses => 'Tanúk';

  @override
  String get fieldWitnessesHint => 'Tanúk neve (opcionális)';

  @override
  String get fieldCategory => 'Kategória';

  @override
  String get fieldMeterReading => 'Mérőóra-állás';

  @override
  String get fieldMeterReadingHint => 'Pl. 12345 kWh';

  @override
  String get fieldKeyCount => 'Kulcsok száma';

  @override
  String get categoryWall => 'Fal / Mennyezet';

  @override
  String get categoryFloor => 'Padló';

  @override
  String get categoryWindow => 'Ablak / Ajtó';

  @override
  String get categoryPlumbing => 'Vízvezeték';

  @override
  String get categoryElectric => 'Elektromosság';

  @override
  String get categoryOther => 'Egyéb';

  @override
  String get sectionHistory => 'Előzmények';

  @override
  String get sectionStatistics => 'Statisztikák';

  @override
  String get sectionDetails => 'Részletek';

  @override
  String get sectionPremium => 'Prémium';

  @override
  String get sectionLegal => 'Jogi információk';

  @override
  String get settingsTitle => 'Beállítások';

  @override
  String get settingsImpressum => 'Impresszum';

  @override
  String get settingsDatenschutz => 'Adatvédelem';

  @override
  String get settingsAgb => 'Felhasználási feltételek';

  @override
  String get settingsVersion => 'Verzió';

  @override
  String get settingsPurchase => 'Prémium feloldása';

  @override
  String get settingsRestore => 'Vásárlás visszaállítása';

  @override
  String get settingsRepeatOnboarding => 'App-Einführung wiederholen';

  @override
  String get paywallTitle => 'Egyszeri feloldás';

  @override
  String get paywallSubtitle => 'Egyszeri fizetés – előfizetés nélkül';

  @override
  String get paywallFeature1 => 'Korlátlan PDF-export';

  @override
  String get paywallFeature2 => 'Hirdetések eltűnnek';

  @override
  String get paywallFeature3 => 'Minden jövőbeli funkció belefoglalva';

  @override
  String get paywallFeature4 => 'Az alkalmazás fejlesztésének támogatása';

  @override
  String get paywallBuyButton => 'Vásárlás most';

  @override
  String get paywallRestoreButton => 'Vásárlás visszaállítása';

  @override
  String get paywallLoadingPrice => 'Ár betöltése…';

  @override
  String get paywallSuccess => 'Prémium aktiválva. Köszönjük!';

  @override
  String get paywallError => 'A vásárlás sikertelen. Próbálja újra.';

  @override
  String get onboardingNext => 'Tovább';

  @override
  String get onboardingStart => 'Kezdés';

  @override
  String get onboardingPrivacyConsent =>
      'Elfogadom az adatvédelmi szabályzatot';

  @override
  String get onboardingPrivacyLink => 'Adatvédelmi szabályzat megtekintése';

  @override
  String get onboardingPrivacyTitle => 'Adatai biztonságban vannak';

  @override
  String get onboardingPrivacyBody =>
      'Minden adat kizárólag az eszközén van tárolva. Nincs felhő, nincs fiók, nincs megosztás.';

  @override
  String get onboardingHeadline0 => 'Veszélyben a kaució?';

  @override
  String get onboardingBody0 =>
      'A DefectLog segítségével strukturáltan dokumentálhatja a hibákat a lakásátadáskor.';

  @override
  String get onboardingHeadline1 => 'Fotózzon és írjon le';

  @override
  String get onboardingBody1 =>
      'Minden hibát rögzítsen fotóval, helyszínnel és pontos leírással.';

  @override
  String get onboardingHeadline2 => 'Minden egy helyen';

  @override
  String get onboardingBody2 =>
      'Az összes hiba áttekinthető előzménye mindig kéznél.';

  @override
  String get onboardingHeadline3 => 'Exportálás PDF-be';

  @override
  String get onboardingBody3 =>
      'Hozzon létre professzionális átadási jegyzőkönyvet PDF formátumban – egyetlen érintéssel.';

  @override
  String get onboardingHeadline4 => 'Adatai az Öné';

  @override
  String get onboardingBody4 =>
      'Az adatok csak helyben tárolódnak. Nincs felhő, nincs előfizetés.';

  @override
  String get permissionCameraAllow => 'Kamera-hozzáférés engedélyezése';

  @override
  String get permissionDeny => 'Nem, köszönöm';

  @override
  String get pdfTitle => 'DefectLog – Átadási jegyzőkönyv';

  @override
  String get pdfCreatedAt => 'Létrehozva';

  @override
  String get pdfTotalEntries => 'Hibák összesen';

  @override
  String get pdfPage => 'Oldal';

  @override
  String get pdfOf => '/';

  @override
  String get errorGeneral => 'Hiba történt';

  @override
  String get errorTryAgain => 'Próbálja újra';

  @override
  String get adRewardButton => 'Hirdetés megtekintése';

  @override
  String get adRewardSuccess => 'A banner 24 órára rejtve.';

  @override
  String get adRewardNotAvailable => 'Nincs elérhető hirdetés.';
}
