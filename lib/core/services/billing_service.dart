import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/app_config.dart';
import 'ad_service.dart';

class BillingService {
  static final BillingService instance = BillingService._();
  BillingService._();

  static const _premiumKey = 'is_premium';
  final _iap = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _sub;

  bool _available = false;
  bool _premium   = false;
  ProductDetails? _product;

  bool get isPremium  => _premium;
  bool get isAvailable => _available;
  ProductDetails? get product => _product;
  VoidCallback? onUpdated;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _premium = prefs.getBool(_premiumKey) ?? false;
    AdService.setPremium(_premium);

    _available = await _iap.isAvailable();
    if (!_available) { debugPrint('BillingService: Store not available'); return; }

    final resp = await _iap.queryProductDetails({AppConfig.productId});
    if (resp.productDetails.isNotEmpty) _product = resp.productDetails.first;

    _sub = _iap.purchaseStream.listen(_onUpdate, onError: (e) => debugPrint('Billing: $e'));
    await _iap.restorePurchases();
  }

  void _onUpdate(List<PurchaseDetails> purchases) async {
    for (final p in purchases) {
      if (p.productID != AppConfig.productId) continue;
      if (p.status == PurchaseStatus.purchased || p.status == PurchaseStatus.restored) {
        await _deliver();
      }
      if (p.pendingCompletePurchase) await _iap.completePurchase(p);
    }
    onUpdated?.call();
  }

  Future<void> _deliver() async {
    _premium = true;
    AdService.setPremium(true);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_premiumKey, true);
  }

  Future<bool> buy() async {
    if (_product == null || !_available) return false;
    try {
      return await _iap.buyNonConsumable(purchaseParam: PurchaseParam(productDetails: _product!));
    } catch (e) { debugPrint('buy() error: $e'); return false; }
  }

  Future<void> restore() async {
    if (!_available) return;
    await _iap.restorePurchases();
  }

  void dispose() { _sub?.cancel(); }
}
