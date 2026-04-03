import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/app_config.dart';

class AdService {
  static const _rewardKey = 'reward_banner_hidden_until';

  static bool _isPremium   = false;
  static bool get isPremium => _isPremium;

  static BannerAd? _banner;
  static bool      _bannerLoaded = false;
  static RewardedAd? _rewarded;

  static Future<void> initPremiumStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isPremium  = prefs.getBool('is_premium') ?? false;
  }

  static void setPremium(bool value) { _isPremium = value; }

  // ── Banner ────────────────────────────────────────────────────────────────

  static Future<bool> isBannerHiddenByReward() async {
    final prefs = await SharedPreferences.getInstance();
    final until = prefs.getInt(_rewardKey) ?? 0;
    return DateTime.now().millisecondsSinceEpoch < until;
  }

  static Future<BannerAd?> loadBanner() async {
    if (_isPremium) return null;
    if (await isBannerHiddenByReward()) return null;
    _banner = BannerAd(
      adUnitId: AppConfig.admobBannerId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded:       (_) => _bannerLoaded = true,
        onAdFailedToLoad: (ad, err) {
          ad.dispose(); _bannerLoaded = false;
          debugPrint('Banner failed: $err');
        },
      ),
    );
    await _banner!.load();
    return _bannerLoaded ? _banner : null;
  }

  static void disposeBanner() {
    _banner?.dispose();
    _banner       = null;
    _bannerLoaded = false;
  }

  // ── Rewarded ──────────────────────────────────────────────────────────────

  static Future<void> loadRewarded() async {
    if (_isPremium) return;
    await RewardedAd.load(
      adUnitId: AppConfig.admobRewardedId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded:       (ad)  => _rewarded = ad,
        onAdFailedToLoad: (err) {
          _rewarded = null;
          debugPrint('Rewarded failed: $err');
        },
      ),
    );
  }

  static bool get isRewardedReady => _rewarded != null;

  static Future<bool> showRewarded({required VoidCallback onRewarded}) async {
    if (_isPremium || _rewarded == null) return false;
    final completer = Completer<bool>();
    _rewarded!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose(); _rewarded = null;
        loadRewarded();
        if (!completer.isCompleted) completer.complete(false);
      },
      onAdFailedToShowFullScreenContent: (ad, _) {
        ad.dispose(); _rewarded = null;
        if (!completer.isCompleted) completer.complete(false);
      },
    );
    await _rewarded!.show(
      onUserEarnedReward: (ad, reward) {
        onRewarded();
        if (!completer.isCompleted) completer.complete(true);
      },
    );
    return completer.future;
  }

  static Future<void> applyBannerHideReward() async {
    final prefs = await SharedPreferences.getInstance();
    final until = DateTime.now()
        .add(const Duration(hours: 24))
        .millisecondsSinceEpoch;
    await prefs.setInt(_rewardKey, until);
  }
}
