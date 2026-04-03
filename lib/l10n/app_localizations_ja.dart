// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'DefectLog';

  @override
  String get navHome => 'ホーム';

  @override
  String get navHistory => '履歴';

  @override
  String get navSettings => '設定';

  @override
  String get actionAdd => '追加';

  @override
  String get actionSave => '保存';

  @override
  String get actionCancel => 'キャンセル';

  @override
  String get actionDelete => '削除';

  @override
  String get actionEdit => '編集';

  @override
  String get actionExport => 'エクスポート';

  @override
  String get statTotal => '合計';

  @override
  String get statThisWeek => '今週';

  @override
  String get statLastEntry => '最新記録';

  @override
  String get statMostCommon => '最多カテゴリ';

  @override
  String get statEntries => '記録';

  @override
  String get noEntriesTitle => '記録なし';

  @override
  String get noEntriesSubtitle => '「＋」をタップして最初の不具合を追加';

  @override
  String get confirmDeleteTitle => '記録を削除しますか？';

  @override
  String get confirmDeleteMessage => 'この操作は取り消せません。';

  @override
  String get confirmDeleteConfirm => '削除';

  @override
  String get toastSaved => '保存しました';

  @override
  String get toastDeleted => '削除しました';

  @override
  String get toastExportDone => 'エクスポート完了';

  @override
  String get fieldDate => '日付';

  @override
  String get fieldTime => '時刻';

  @override
  String get fieldDescription => '説明';

  @override
  String get fieldDescriptionHint => '不具合を簡潔に説明';

  @override
  String get fieldPhoto => '写真';

  @override
  String get fieldNotes => 'メモ';

  @override
  String get fieldNotesHint => '補足情報';

  @override
  String get fieldLocation => '場所';

  @override
  String get fieldLocationHint => '例：キッチン、バスルーム';

  @override
  String get fieldWitnesses => '立会人';

  @override
  String get fieldWitnessesHint => '立会人の氏名';

  @override
  String get fieldCategory => 'カテゴリ';

  @override
  String get fieldMeterReading => 'メーター読み取り値';

  @override
  String get fieldMeterReadingHint => '現在の値';

  @override
  String get fieldKeyCount => '鍵の本数';

  @override
  String get categoryWall => '壁';

  @override
  String get categoryFloor => '床';

  @override
  String get categoryWindow => '窓';

  @override
  String get categoryPlumbing => '配管';

  @override
  String get categoryElectric => '電気';

  @override
  String get categoryOther => 'その他';

  @override
  String get sectionHistory => '履歴';

  @override
  String get sectionStatistics => '統計';

  @override
  String get sectionDetails => '詳細';

  @override
  String get sectionPremium => 'プレミアム';

  @override
  String get sectionLegal => '法的情報';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsImpressum => '運営情報';

  @override
  String get settingsDatenschutz => 'プライバシーポリシー';

  @override
  String get settingsAgb => '利用規約';

  @override
  String get settingsVersion => 'バージョン';

  @override
  String get settingsPurchase => 'プレミアム解除';

  @override
  String get settingsRestore => '購入を復元';

  @override
  String get paywallTitle => '一度の購入で永久利用';

  @override
  String get paywallSubtitle => '買い切り型、サブスクなし';

  @override
  String get paywallFeature1 => 'PDFエクスポート';

  @override
  String get paywallFeature2 => '広告なし';

  @override
  String get paywallFeature3 => '今後のアップデート全て';

  @override
  String get paywallFeature4 => 'データは端末内のみ保存';

  @override
  String get paywallBuyButton => '今すぐ購入';

  @override
  String get paywallRestoreButton => '購入を復元';

  @override
  String get paywallLoadingPrice => '価格を読み込み中…';

  @override
  String get paywallSuccess => 'プレミアム有効化完了！';

  @override
  String get paywallError => '購入に失敗しました。再試行してください。';

  @override
  String get onboardingNext => '次へ';

  @override
  String get onboardingStart => '始める';

  @override
  String get onboardingPrivacyConsent => 'プライバシーポリシーに同意する';

  @override
  String get onboardingPrivacyLink => 'プライバシーポリシー';

  @override
  String get onboardingPrivacyTitle => 'データ保護';

  @override
  String get onboardingPrivacyBody => 'データは端末内にのみ保存されます。クラウドへの送信は一切ありません。';

  @override
  String get onboardingHeadline0 => '敷金が危ない？';

  @override
  String get onboardingBody0 => '入退室時の不具合を整理して記録し、権利を守ろう。';

  @override
  String get onboardingHeadline1 => '写真が証拠になる';

  @override
  String get onboardingBody1 => '現場で日付・説明付きの写真を撮影。';

  @override
  String get onboardingHeadline2 => 'データは手元に';

  @override
  String get onboardingBody2 => '記録は端末内のみ保存。クラウド不使用。';

  @override
  String get onboardingHeadline3 => 'ワンタップでPDF';

  @override
  String get onboardingBody3 => '引渡しレポートを数秒で作成。';

  @override
  String get onboardingHeadline4 => 'いつでも万全の準備';

  @override
  String get onboardingBody4 => '不具合を記録済み。今すぐ始めよう。';

  @override
  String get permissionCameraAllow => 'カメラを許可';

  @override
  String get permissionDeny => '後で';

  @override
  String get pdfTitle => 'DefectLog – 引渡しレポート';

  @override
  String get pdfCreatedAt => '作成日';

  @override
  String get pdfTotalEntries => '記録総数';

  @override
  String get pdfPage => 'ページ';

  @override
  String get pdfOf => '/';

  @override
  String get errorGeneral => 'エラーが発生しました';

  @override
  String get errorTryAgain => '再試行';
}
