// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'DefectLog';

  @override
  String get navHome => 'หน้าหลัก';

  @override
  String get navHistory => 'ประวัติ';

  @override
  String get navSettings => 'ตั้งค่า';

  @override
  String get actionAdd => 'เพิ่ม';

  @override
  String get actionSave => 'บันทึก';

  @override
  String get actionCancel => 'ยกเลิก';

  @override
  String get actionDelete => 'ลบ';

  @override
  String get actionEdit => 'แก้ไข';

  @override
  String get actionExport => 'ส่งออก';

  @override
  String get statTotal => 'ทั้งหมด';

  @override
  String get statThisWeek => 'สัปดาห์นี้';

  @override
  String get statLastEntry => 'รายการล่าสุด';

  @override
  String get statMostCommon => 'พบบ่อยที่สุด';

  @override
  String get statEntries => 'รายการ';

  @override
  String get noEntriesTitle => 'ยังไม่มีรายการ';

  @override
  String get noEntriesSubtitle => 'กด «+» เพื่อเพิ่มข้อบกพร่องแรก';

  @override
  String get confirmDeleteTitle => 'ลบรายการ?';

  @override
  String get confirmDeleteMessage => 'ไม่สามารถยกเลิกการดำเนินการนี้ได้';

  @override
  String get confirmDeleteConfirm => 'ลบ';

  @override
  String get toastSaved => 'บันทึกแล้ว';

  @override
  String get toastDeleted => 'ลบแล้ว';

  @override
  String get toastExportDone => 'ส่งออกเสร็จสิ้น';

  @override
  String get fieldDate => 'วันที่';

  @override
  String get fieldTime => 'เวลา';

  @override
  String get fieldDescription => 'คำอธิบาย';

  @override
  String get fieldDescriptionHint => 'อธิบายข้อบกพร่องโดยย่อ';

  @override
  String get fieldPhoto => 'รูปภาพ';

  @override
  String get fieldNotes => 'หมายเหตุ';

  @override
  String get fieldNotesHint => 'ข้อมูลเพิ่มเติม';

  @override
  String get fieldLocation => 'ตำแหน่ง';

  @override
  String get fieldLocationHint => 'เช่น: ห้องครัว, ห้องน้ำ';

  @override
  String get fieldWitnesses => 'พยาน';

  @override
  String get fieldWitnessesHint => 'ชื่อพยาน';

  @override
  String get fieldCategory => 'หมวดหมู่';

  @override
  String get fieldMeterReading => 'ค่ามิเตอร์';

  @override
  String get fieldMeterReadingHint => 'ค่าปัจจุบัน';

  @override
  String get fieldKeyCount => 'จำนวนกุญแจ';

  @override
  String get categoryWall => 'ผนัง';

  @override
  String get categoryFloor => 'พื้น';

  @override
  String get categoryWindow => 'หน้าต่าง';

  @override
  String get categoryPlumbing => 'ระบบประปา';

  @override
  String get categoryElectric => 'ไฟฟ้า';

  @override
  String get categoryOther => 'อื่น ๆ';

  @override
  String get sectionHistory => 'ประวัติ';

  @override
  String get sectionStatistics => 'สถิติ';

  @override
  String get sectionDetails => 'รายละเอียด';

  @override
  String get sectionPremium => 'พรีเมียม';

  @override
  String get sectionLegal => 'ข้อมูลทางกฎหมาย';

  @override
  String get settingsTitle => 'ตั้งค่า';

  @override
  String get settingsImpressum => 'ข้อมูลผู้เผยแพร่';

  @override
  String get settingsDatenschutz => 'นโยบายความเป็นส่วนตัว';

  @override
  String get settingsAgb => 'ข้อกำหนดการใช้งาน';

  @override
  String get settingsVersion => 'เวอร์ชัน';

  @override
  String get settingsPurchase => 'ปลดล็อกพรีเมียม';

  @override
  String get settingsRestore => 'กู้คืนการซื้อ';

  @override
  String get settingsRepeatOnboarding => 'App-Einführung wiederholen';

  @override
  String get paywallTitle => 'ซื้อครั้งเดียว ใช้ตลอดไป';

  @override
  String get paywallSubtitle => 'จ่ายครั้งเดียว — ไม่มีสมาชิกรายเดือน';

  @override
  String get paywallFeature1 => 'ส่งออก PDF';

  @override
  String get paywallFeature2 => 'ไม่มีโฆษณา';

  @override
  String get paywallFeature3 => 'อัปเดตทั้งหมดในอนาคต';

  @override
  String get paywallFeature4 => 'ข้อมูลเก็บในเครื่องเท่านั้น';

  @override
  String get paywallBuyButton => 'ซื้อเลย';

  @override
  String get paywallRestoreButton => 'กู้คืนการซื้อ';

  @override
  String get paywallLoadingPrice => 'กำลังโหลดราคา…';

  @override
  String get paywallSuccess => 'เปิดใช้งานพรีเมียมแล้ว!';

  @override
  String get paywallError => 'การซื้อล้มเหลว กรุณาลองอีกครั้ง';

  @override
  String get onboardingNext => 'ถัดไป';

  @override
  String get onboardingStart => 'เริ่มต้น';

  @override
  String get onboardingPrivacyConsent => 'ฉันยอมรับนโยบายความเป็นส่วนตัว';

  @override
  String get onboardingPrivacyLink => 'นโยบายความเป็นส่วนตัว';

  @override
  String get onboardingPrivacyTitle => 'การคุ้มครองข้อมูล';

  @override
  String get onboardingPrivacyBody =>
      'ข้อมูลทั้งหมดเก็บไว้ในเครื่องของคุณเท่านั้น ไม่มีการส่งข้อมูลขึ้น Cloud';

  @override
  String get onboardingHeadline0 => 'เงินประกันตกอยู่ในความเสี่ยง?';

  @override
  String get onboardingBody0 =>
      'บันทึกข้อบกพร่องตอนเข้าและออกอย่างเป็นระบบ เพื่อปกป้องสิทธิ์ของคุณ';

  @override
  String get onboardingHeadline1 => 'รูปภาพคือหลักฐาน';

  @override
  String get onboardingBody1 =>
      'ถ่ายภาพข้อบกพร่องพร้อมวันที่และคำอธิบาย ณ สถานที่จริง';

  @override
  String get onboardingHeadline2 => 'ข้อมูลอยู่ในมือคุณ';

  @override
  String get onboardingBody2 => 'บันทึกเก็บในเครื่องเท่านั้น ไม่ผ่าน Cloud';

  @override
  String get onboardingHeadline3 => 'PDF แตะเดียว';

  @override
  String get onboardingBody3 => 'สร้างรายงานการส่งมอบได้ในไม่กี่วินาที';

  @override
  String get onboardingHeadline4 => 'พร้อมสำหรับทุกสถานการณ์';

  @override
  String get onboardingBody4 => 'ข้อบกพร่องถูกบันทึกแล้ว เริ่มใช้งานได้เลย';

  @override
  String get permissionCameraAllow => 'อนุญาตกล้อง';

  @override
  String get permissionDeny => 'ไม่ใช่ตอนนี้';

  @override
  String get pdfTitle => 'DefectLog – รายงานการส่งมอบ';

  @override
  String get pdfCreatedAt => 'สร้างเมื่อ';

  @override
  String get pdfTotalEntries => 'รายการทั้งหมด';

  @override
  String get pdfPage => 'หน้า';

  @override
  String get pdfOf => 'จาก';

  @override
  String get errorGeneral => 'เกิดข้อผิดพลาด';

  @override
  String get errorTryAgain => 'ลองอีกครั้ง';

  @override
  String get adRewardButton => 'ดูโฆษณา';

  @override
  String get adRewardSuccess => 'ซ่อนแบนเนอร์ 24 ชม.';

  @override
  String get adRewardNotAvailable => 'ไม่มีโฆษณา';
}
