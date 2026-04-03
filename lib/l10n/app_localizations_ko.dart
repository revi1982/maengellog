// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'DefectLog';

  @override
  String get navHome => '홈';

  @override
  String get navHistory => '기록';

  @override
  String get navSettings => '설정';

  @override
  String get actionAdd => '추가';

  @override
  String get actionSave => '저장';

  @override
  String get actionCancel => '취소';

  @override
  String get actionDelete => '삭제';

  @override
  String get actionEdit => '수정';

  @override
  String get actionExport => '내보내기';

  @override
  String get statTotal => '전체';

  @override
  String get statThisWeek => '이번 주';

  @override
  String get statLastEntry => '최근 기록';

  @override
  String get statMostCommon => '가장 많은';

  @override
  String get statEntries => '기록';

  @override
  String get noEntriesTitle => '기록 없음';

  @override
  String get noEntriesSubtitle => '「+」를 눌러 첫 번째 결함을 추가하세요';

  @override
  String get confirmDeleteTitle => '기록을 삭제할까요?';

  @override
  String get confirmDeleteMessage => '이 작업은 취소할 수 없습니다.';

  @override
  String get confirmDeleteConfirm => '삭제';

  @override
  String get toastSaved => '저장되었습니다';

  @override
  String get toastDeleted => '삭제되었습니다';

  @override
  String get toastExportDone => '내보내기 완료';

  @override
  String get fieldDate => '날짜';

  @override
  String get fieldTime => '시간';

  @override
  String get fieldDescription => '설명';

  @override
  String get fieldDescriptionHint => '결함을 간단히 설명하세요';

  @override
  String get fieldPhoto => '사진';

  @override
  String get fieldNotes => '메모';

  @override
  String get fieldNotesHint => '추가 정보';

  @override
  String get fieldLocation => '위치';

  @override
  String get fieldLocationHint => '예: 주방, 욕실';

  @override
  String get fieldWitnesses => '증인';

  @override
  String get fieldWitnessesHint => '증인 이름';

  @override
  String get fieldCategory => '카테고리';

  @override
  String get fieldMeterReading => '계량기 수치';

  @override
  String get fieldMeterReadingHint => '현재 수치';

  @override
  String get fieldKeyCount => '열쇠 수';

  @override
  String get categoryWall => '벽';

  @override
  String get categoryFloor => '바닥';

  @override
  String get categoryWindow => '창문';

  @override
  String get categoryPlumbing => '배관';

  @override
  String get categoryElectric => '전기';

  @override
  String get categoryOther => '기타';

  @override
  String get sectionHistory => '기록';

  @override
  String get sectionStatistics => '통계';

  @override
  String get sectionDetails => '세부 정보';

  @override
  String get sectionPremium => '프리미엄';

  @override
  String get sectionLegal => '법적 정보';

  @override
  String get settingsTitle => '설정';

  @override
  String get settingsImpressum => '사업자 정보';

  @override
  String get settingsDatenschutz => '개인정보 처리방침';

  @override
  String get settingsAgb => '이용약관';

  @override
  String get settingsVersion => '버전';

  @override
  String get settingsPurchase => '프리미엄 잠금 해제';

  @override
  String get settingsRestore => '구매 복원';

  @override
  String get paywallTitle => '한 번 구매, 평생 사용';

  @override
  String get paywallSubtitle => '일회성 결제 — 구독 없음';

  @override
  String get paywallFeature1 => 'PDF 내보내기';

  @override
  String get paywallFeature2 => '광고 없음';

  @override
  String get paywallFeature3 => '모든 향후 업데이트';

  @override
  String get paywallFeature4 => '데이터는 기기에만 저장';

  @override
  String get paywallBuyButton => '지금 구매';

  @override
  String get paywallRestoreButton => '구매 복원';

  @override
  String get paywallLoadingPrice => '가격 불러오는 중…';

  @override
  String get paywallSuccess => '프리미엄이 활성화되었습니다!';

  @override
  String get paywallError => '구매에 실패했습니다. 다시 시도하세요.';

  @override
  String get onboardingNext => '다음';

  @override
  String get onboardingStart => '시작하기';

  @override
  String get onboardingPrivacyConsent => '개인정보 처리방침에 동의합니다';

  @override
  String get onboardingPrivacyLink => '개인정보 처리방침';

  @override
  String get onboardingPrivacyTitle => '데이터 보호';

  @override
  String get onboardingPrivacyBody => '모든 데이터는 기기에만 저장됩니다. 클라우드로 전송되지 않습니다.';

  @override
  String get onboardingHeadline0 => '보증금이 위험한가요?';

  @override
  String get onboardingBody0 => '입주 및 퇴거 시 결함을 체계적으로 기록하여 권리를 보호하세요.';

  @override
  String get onboardingHeadline1 => '사진이 증거입니다';

  @override
  String get onboardingBody1 => '현장에서 날짜와 설명을 포함한 결함 사진을 촬영하세요.';

  @override
  String get onboardingHeadline2 => '데이터는 내 손 안에';

  @override
  String get onboardingBody2 => '기록은 기기 내에만 저장됩니다. 클라우드 없음.';

  @override
  String get onboardingHeadline3 => '한 번의 탭으로 PDF';

  @override
  String get onboardingBody3 => '몇 초 만에 인도 보고서를 생성하세요.';

  @override
  String get onboardingHeadline4 => '결정적 순간을 위한 준비';

  @override
  String get onboardingBody4 => '결함이 모두 기록되었습니다. 지금 시작하세요.';

  @override
  String get permissionCameraAllow => '카메라 허용';

  @override
  String get permissionDeny => '나중에';

  @override
  String get pdfTitle => 'DefectLog – 인도 보고서';

  @override
  String get pdfCreatedAt => '작성일';

  @override
  String get pdfTotalEntries => '총 기록 수';

  @override
  String get pdfPage => '페이지';

  @override
  String get pdfOf => '/';

  @override
  String get errorGeneral => '오류가 발생했습니다';

  @override
  String get errorTryAgain => '다시 시도';
}
