// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'DefectLog';

  @override
  String get navHome => '主页';

  @override
  String get navHistory => '历史';

  @override
  String get navSettings => '设置';

  @override
  String get actionAdd => '添加';

  @override
  String get actionSave => '保存';

  @override
  String get actionCancel => '取消';

  @override
  String get actionDelete => '删除';

  @override
  String get actionEdit => '编辑';

  @override
  String get actionExport => '导出';

  @override
  String get statTotal => '总计';

  @override
  String get statThisWeek => '本周';

  @override
  String get statLastEntry => '最近记录';

  @override
  String get statMostCommon => '最常见';

  @override
  String get statEntries => '记录';

  @override
  String get noEntriesTitle => '暂无记录';

  @override
  String get noEntriesSubtitle => '点击「+」添加第一条缺陷';

  @override
  String get confirmDeleteTitle => '删除记录？';

  @override
  String get confirmDeleteMessage => '此操作无法撤销。';

  @override
  String get confirmDeleteConfirm => '删除';

  @override
  String get toastSaved => '已保存';

  @override
  String get toastDeleted => '已删除';

  @override
  String get toastExportDone => '导出完成';

  @override
  String get fieldDate => '日期';

  @override
  String get fieldTime => '时间';

  @override
  String get fieldDescription => '描述';

  @override
  String get fieldDescriptionHint => '简述缺陷';

  @override
  String get fieldPhoto => '照片';

  @override
  String get fieldNotes => '备注';

  @override
  String get fieldNotesHint => '补充说明';

  @override
  String get fieldLocation => '位置';

  @override
  String get fieldLocationHint => '如：厨房、浴室';

  @override
  String get fieldWitnesses => '证人';

  @override
  String get fieldWitnessesHint => '证人姓名';

  @override
  String get fieldCategory => '类别';

  @override
  String get fieldMeterReading => '表计读数';

  @override
  String get fieldMeterReadingHint => '当前读数';

  @override
  String get fieldKeyCount => '钥匙数量';

  @override
  String get categoryWall => '墙壁';

  @override
  String get categoryFloor => '地板';

  @override
  String get categoryWindow => '窗户';

  @override
  String get categoryPlumbing => '管道';

  @override
  String get categoryElectric => '电气';

  @override
  String get categoryOther => '其他';

  @override
  String get sectionHistory => '历史';

  @override
  String get sectionStatistics => '统计';

  @override
  String get sectionDetails => '详情';

  @override
  String get sectionPremium => '高级版';

  @override
  String get sectionLegal => '法律信息';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsImpressum => '出版信息';

  @override
  String get settingsDatenschutz => '隐私政策';

  @override
  String get settingsAgb => '使用条款';

  @override
  String get settingsVersion => '版本';

  @override
  String get settingsPurchase => '解锁高级版';

  @override
  String get settingsRestore => '恢复购买';

  @override
  String get paywallTitle => '一次购买，永久使用';

  @override
  String get paywallSubtitle => '一次性付款，无需订阅';

  @override
  String get paywallFeature1 => 'PDF导出';

  @override
  String get paywallFeature2 => '无广告';

  @override
  String get paywallFeature3 => '所有后续更新';

  @override
  String get paywallFeature4 => '数据仅存储在本地';

  @override
  String get paywallBuyButton => '立即购买';

  @override
  String get paywallRestoreButton => '恢复购买';

  @override
  String get paywallLoadingPrice => '价格加载中…';

  @override
  String get paywallSuccess => '高级版已激活！';

  @override
  String get paywallError => '购买失败，请重试。';

  @override
  String get onboardingNext => '下一步';

  @override
  String get onboardingStart => '开始';

  @override
  String get onboardingPrivacyConsent => '我同意隐私政策';

  @override
  String get onboardingPrivacyLink => '隐私政策';

  @override
  String get onboardingPrivacyTitle => '数据保护';

  @override
  String get onboardingPrivacyBody => '所有数据仅存储在您的设备上，不上传云端。';

  @override
  String get onboardingHeadline0 => '押金面临风险？';

  @override
  String get onboardingBody0 => '入住和退租时有条理地记录缺陷，保护您的权益。';

  @override
  String get onboardingHeadline1 => '照片为证';

  @override
  String get onboardingBody1 => '在现场拍摄缺陷，附上日期和描述。';

  @override
  String get onboardingHeadline2 => '数据由您掌控';

  @override
  String get onboardingBody2 => '记录仅存于本地设备，无云端。';

  @override
  String get onboardingHeadline3 => '一键生成PDF';

  @override
  String get onboardingBody3 => '几秒钟内生成交房报告。';

  @override
  String get onboardingHeadline4 => '随时备战';

  @override
  String get onboardingBody4 => '缺陷已记录在案，立即开始吧。';

  @override
  String get permissionCameraAllow => '允许相机';

  @override
  String get permissionDeny => '暂不';

  @override
  String get pdfTitle => 'DefectLog – 交房报告';

  @override
  String get pdfCreatedAt => '创建于';

  @override
  String get pdfTotalEntries => '记录总数';

  @override
  String get pdfPage => '第';

  @override
  String get pdfOf => '页，共';

  @override
  String get errorGeneral => '发生错误';

  @override
  String get errorTryAgain => '重试';
}
