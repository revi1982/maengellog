// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appName => 'DefectLog';

  @override
  String get navHome => 'Начало';

  @override
  String get navHistory => 'История';

  @override
  String get navSettings => 'Настройки';

  @override
  String get actionAdd => 'Добави';

  @override
  String get actionSave => 'Запази';

  @override
  String get actionCancel => 'Отказ';

  @override
  String get actionDelete => 'Изтрий';

  @override
  String get actionEdit => 'Редактирай';

  @override
  String get actionExport => 'Експортирай';

  @override
  String get statTotal => 'Общо';

  @override
  String get statThisWeek => 'Тази седмица';

  @override
  String get statLastEntry => 'Последен запис';

  @override
  String get statMostCommon => 'Най-честото';

  @override
  String get statEntries => 'Записи';

  @override
  String get noEntriesTitle => 'Няма записи';

  @override
  String get noEntriesSubtitle =>
      'Добавете първия дефект, като натиснете бутона +';

  @override
  String get confirmDeleteTitle => 'Изтриване на записа?';

  @override
  String get confirmDeleteMessage => 'Това действие не може да бъде отменено.';

  @override
  String get confirmDeleteConfirm => 'Изтрий';

  @override
  String get toastSaved => 'Запазено';

  @override
  String get toastDeleted => 'Изтрито';

  @override
  String get toastExportDone => 'Експортирането завърши';

  @override
  String get fieldDate => 'Дата';

  @override
  String get fieldTime => 'Час';

  @override
  String get fieldDescription => 'Описание на дефекта';

  @override
  String get fieldDescriptionHint => 'Опишете дефекта възможно най-подробно';

  @override
  String get fieldPhoto => 'Снимка';

  @override
  String get fieldNotes => 'Бележки';

  @override
  String get fieldNotesHint => 'Допълнителни бележки (по желание)';

  @override
  String get fieldLocation => 'Местоположение';

  @override
  String get fieldLocationHint => 'Напр. хол, баня';

  @override
  String get fieldWitnesses => 'Свидетели';

  @override
  String get fieldWitnessesHint => 'Имена на свидетели (по желание)';

  @override
  String get fieldCategory => 'Категория';

  @override
  String get fieldMeterReading => 'Показание на брояча';

  @override
  String get fieldMeterReadingHint => 'Напр. 12345 kWh';

  @override
  String get fieldKeyCount => 'Брой ключове';

  @override
  String get categoryWall => 'Стена / Таван';

  @override
  String get categoryFloor => 'Под';

  @override
  String get categoryWindow => 'Прозорец / Врата';

  @override
  String get categoryPlumbing => 'ВиК инсталация';

  @override
  String get categoryElectric => 'Електричество';

  @override
  String get categoryOther => 'Друго';

  @override
  String get sectionHistory => 'История';

  @override
  String get sectionStatistics => 'Статистики';

  @override
  String get sectionDetails => 'Детайли';

  @override
  String get sectionPremium => 'Премиум';

  @override
  String get sectionLegal => 'Правна информация';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsImpressum => 'Импресум';

  @override
  String get settingsDatenschutz => 'Защита на данните';

  @override
  String get settingsAgb => 'Общи условия';

  @override
  String get settingsVersion => 'Версия';

  @override
  String get settingsPurchase => 'Отключи Премиум';

  @override
  String get settingsRestore => 'Възстанови покупката';

  @override
  String get paywallTitle => 'Отключи веднъж';

  @override
  String get paywallSubtitle => 'Еднократно плащане – без абонамент';

  @override
  String get paywallFeature1 => 'Неограничен PDF-експорт';

  @override
  String get paywallFeature2 => 'Без реклами';

  @override
  String get paywallFeature3 => 'Всички бъдещи функции включени';

  @override
  String get paywallFeature4 => 'Подкрепете разработката на приложението';

  @override
  String get paywallBuyButton => 'Купи сега';

  @override
  String get paywallRestoreButton => 'Възстанови покупката';

  @override
  String get paywallLoadingPrice => 'Зареждане на цената…';

  @override
  String get paywallSuccess => 'Премиумът е активиран. Благодарим!';

  @override
  String get paywallError => 'Покупката не бе успешна. Опитайте отново.';

  @override
  String get onboardingNext => 'Напред';

  @override
  String get onboardingStart => 'Начало';

  @override
  String get onboardingPrivacyConsent => 'Приемам политиката за поверителност';

  @override
  String get onboardingPrivacyLink => 'Виж политиката за поверителност';

  @override
  String get onboardingPrivacyTitle => 'Данните ви са в безопасност';

  @override
  String get onboardingPrivacyBody =>
      'Всички данни се съхраняват само на вашето устройство. Без облак, без акаунт, без споделяне.';

  @override
  String get onboardingHeadline0 => 'Депозитът в опасност ли е?';

  @override
  String get onboardingBody0 =>
      'DefectLog ви помага да документирате структурирано дефектите при предаване на апартамента.';

  @override
  String get onboardingHeadline1 => 'Снимайте и описвайте';

  @override
  String get onboardingBody1 =>
      'Записвайте всеки дефект със снимка, местоположение и точно описание.';

  @override
  String get onboardingHeadline2 => 'Всичко на едно място';

  @override
  String get onboardingBody2 =>
      'Прегледна история на всички дефекти винаги под ръка.';

  @override
  String get onboardingHeadline3 => 'Експорт като PDF';

  @override
  String get onboardingBody3 =>
      'Създайте професионален протокол за предаване като PDF – с едно докосване.';

  @override
  String get onboardingHeadline4 => 'Данните ви принадлежат на вас';

  @override
  String get onboardingBody4 =>
      'Данните се съхраняват само локално. Без облак, без абонамент.';

  @override
  String get permissionCameraAllow => 'Разреши достъп до камерата';

  @override
  String get permissionDeny => 'Не, благодаря';

  @override
  String get pdfTitle => 'DefectLog – Протокол за предаване';

  @override
  String get pdfCreatedAt => 'Създадено на';

  @override
  String get pdfTotalEntries => 'Общ брой дефекти';

  @override
  String get pdfPage => 'Страница';

  @override
  String get pdfOf => 'от';

  @override
  String get errorGeneral => 'Възникна грешка';

  @override
  String get errorTryAgain => 'Опитайте отново';

  @override
  String get adRewardButton => 'Гледай реклама';

  @override
  String get adRewardSuccess => 'Банерът е скрит за 24 ч.';

  @override
  String get adRewardNotAvailable => 'Няма налична реклама.';
}
