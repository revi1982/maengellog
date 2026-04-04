import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/app_config.dart';

class AdService {
  static const _rewardKey   = 'reward_banner_hidden_until';
  static const _rewardHours = 2;

  static bool _isPremium   = false;
  static bool get isPremium => _isPremium;

  static BannerAd?               _banner;
  static bool                    _bannerLoaded = false;
  static RewardedAd?             _rewarded;
  static RewardedInterstitialAd? _rewardedInterstitial;
  static AppOpenAd?              _appOpenAd;
  static bool                    _appOpenShowing = false;
  static InterstitialAd?         _interstitial;

  // ── Premium ────────────────────────────────────────────────────────────────
  static Future<void> initPremiumStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isPremium  = prefs.getBool('is_premium') ?? false;
  }

  static void setPremium(bool value) { _isPremium = value; }

  // ── UMP Consent ────────────────────────────────────────────────────────────
  static void requestConsentIfNeeded() {
    try {
      ConsentInformation.instance.requestConsentInfoUpdate(
        ConsentRequestParameters(),
        () async {
          try {
            if (await ConsentInformation.instance.isConsentFormAvailable()) {
              ConsentForm.loadConsentForm(
                (form) => form.show((_) {}),
                (error) => debugPrint('UMP form load error: ${error.message}'),
              );
            }
          } catch (_) {}
        },
        (FormError error) {
          debugPrint('UMP error: ${error.message}');
        },
      );
    } catch (e) {
      debugPrint('UMP not available: $e');
    }
  }

  // ── Banner ─────────────────────────────────────────────────────────────────
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

  // ── Rewarded ───────────────────────────────────────────────────────────────
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
        .add(const Duration(hours: _rewardHours))
        .millisecondsSinceEpoch;
    await prefs.setInt(_rewardKey, until);
  }

  // ── Rewarded Interstitial ──────────────────────────────────────────────────
  static Future<void> loadRewardedInterstitial() async {
    if (_isPremium) return;
    await RewardedInterstitialAd.load(
      adUnitId: AppConfig.admobRewardedInterstitialId,
      request: const AdRequest(),
      rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
        onAdLoaded:       (ad)  => _rewardedInterstitial = ad,
        onAdFailedToLoad: (err) {
          _rewardedInterstitial = null;
          debugPrint('RewardedInterstitial failed: $err');
        },
      ),
    );
  }

  static bool get isRewardedInterstitialReady => _rewardedInterstitial != null;

  static Future<void> showRewardedInterstitial({
    required VoidCallback onRewarded,
  }) async {
    if (_isPremium || _rewardedInterstitial == null) return;
    _rewardedInterstitial!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose(); _rewardedInterstitial = null;
        loadRewardedInterstitial();
      },
      onAdFailedToShowFullScreenContent: (ad, _) {
        ad.dispose(); _rewardedInterstitial = null;
      },
    );
    await _rewardedInterstitial!.show(
      onUserEarnedReward: (ad, reward) => onRewarded(),
    );
  }

  // ── App Open ───────────────────────────────────────────────────────────────
  static Future<void> loadAppOpen() async {
    if (_isPremium) return;
    await AppOpenAd.load(
      adUnitId: AppConfig.admobAppOpenId,
      request: const AdRequest(),
      orientation: AppOpenAd.orientationPortrait,
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded:       (ad)  => _appOpenAd = ad,
        onAdFailedToLoad: (err) {
          _appOpenAd = null;
          debugPrint('AppOpen failed: $err');
        },
      ),
    );
  }

  static bool get isAppOpenReady => _appOpenAd != null && !_appOpenShowing;

  static void showAppOpenIfAvailable() {
    if (_isPremium || _appOpenAd == null || _appOpenShowing) return;
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (_) => _appOpenShowing = true,
      onAdDismissedFullScreenContent: (ad) {
        _appOpenShowing = false;
        ad.dispose(); _appOpenAd = null;
        loadAppOpen();
      },
      onAdFailedToShowFullScreenContent: (ad, _) {
        _appOpenShowing = false;
        ad.dispose(); _appOpenAd = null;
      },
    );
    _appOpenAd!.show();
  }

  // ── Interstitial ───────────────────────────────────────────────────────────
  static Future<void> loadInterstitial() async {
    if (_isPremium) return;
    await InterstitialAd.load(
      adUnitId: AppConfig.admobInterstitialId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded:       (ad) => _interstitial = ad,
        onAdFailedToLoad: (err) {
          _interstitial = null;
          debugPrint('Interstitial failed: $err');
        },
      ),
    );
  }

  static bool get isInterstitialReady => _interstitial != null;

  static void showInterstitialIfAvailable() {
    if (_isPremium || _interstitial == null) return;
    _interstitial!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose(); _interstitial = null;
        loadInterstitial();
      },
      onAdFailedToShowFullScreenContent: (ad, _) {
        ad.dispose(); _interstitial = null;
      },
    );
    _interstitial!.show();
    _interstitial = null;
  }
}
