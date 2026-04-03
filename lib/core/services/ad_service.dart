import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/app_config.dart';

class AdService {
  static bool _isPremium   = false;
  static bool get isPremium => _isPremium;

  static BannerAd? _banner;
  static bool      _bannerLoaded = false;
  static InterstitialAd? _interstitial;

  static Future<void> initPremiumStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isPremium  = prefs.getBool('is_premium') ?? false;
  }

  static void setPremium(bool value) { _isPremium = value; }

  static Future<BannerAd?> loadBanner() async {
    if (_isPremium) return null;
    _banner = BannerAd(
      adUnitId: AppConfig.admobBannerId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => _bannerLoaded = true,
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

  static Future<void> loadInterstitial() async {
    if (_isPremium) return;
    await InterstitialAd.load(
      adUnitId: AppConfig.admobInterstitialId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded:       (ad)  => _interstitial = ad,
        onAdFailedToLoad: (err) {
          _interstitial = null;
          debugPrint('Interstitial failed: $err');
        },
      ),
    );
  }

  static Future<void> showInterstitial() async {
    if (_isPremium || _interstitial == null) return;
    _interstitial!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose(); _interstitial = null; loadInterstitial();
      },
      onAdFailedToShowFullScreenContent: (ad, _) {
        ad.dispose(); _interstitial = null;
      },
    );
    await _interstitial!.show();
  }
}
