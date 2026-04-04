import 'package:flutter/material.dart';
import '../../core/services/billing_service.dart';
import '../../l10n/app_localizations.dart';

class MaengelLogPaywallScreen extends StatefulWidget {
  const MaengelLogPaywallScreen({super.key});
  @override
  State<MaengelLogPaywallScreen> createState() => _MaengelLogPaywallScreenState();
}

class _MaengelLogPaywallScreenState extends State<MaengelLogPaywallScreen> {
  bool _buying = false;
  bool _restoring = false;

  @override
  void initState() {
    super.initState();
    BillingService.instance.onUpdated = _onUpdated;
  }

  @override
  void dispose() {
    BillingService.instance.onUpdated = null;
    super.dispose();
  }

  void _onUpdated() {
    if (!mounted) return;
    setState(() => _buying = false);
    if (BillingService.instance.isPremium) Navigator.pop(context, true);
  }

  Future<void> _buy() async {
    setState(() => _buying = true);
    final ok = await BillingService.instance.buy();
    if (!ok && mounted) {
      setState(() => _buying = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.paywallError)));
    }
  }

  Future<void> _restore() async {
    setState(() => _restoring = true);
    await BillingService.instance.restore();
    if (mounted) setState(() => _restoring = false);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final primary = Theme.of(context).colorScheme.primary;
    final price = BillingService.instance.product?.price;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF4F5FA),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            const SizedBox(height: 24),
            Container(
              width: 72, height: 72,
              decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(20)),
              child: const Icon(Icons.star_outline, size: 34, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(l.paywallTitle, style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF111122))),
            const SizedBox(height: 8),
            Text(l.paywallSubtitle, style: const TextStyle(
              fontSize: 15, color: Color(0xFF6B6B8D))),
            const SizedBox(height: 28),
            ...[
              (Icons.picture_as_pdf_outlined, l.paywallFeature1),
              (Icons.block_outlined,          l.paywallFeature2),
              (Icons.all_inclusive_outlined,  l.paywallFeature3),
              (Icons.favorite_outline,        l.paywallFeature4),
            ].map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(children: [
                Container(
                  width: 36, height: 36,
                  decoration: BoxDecoration(
                      color: primary.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(item.$1, size: 18, color: primary),
                ),
                const SizedBox(width: 12),
                Text(item.$2, style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF111122))),
              ]),
            )),
            const Spacer(),
            SizedBox(
              width: double.infinity, height: 56,
              child: ElevatedButton(
                onPressed: (_buying || _restoring) ? null : _buy,
                child: _buying
                    ? const SizedBox(width: 20, height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                    : Text(
                        price != null ? '${l.paywallBuyButton} · $price' : l.paywallLoadingPrice,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: (_buying || _restoring) ? null : _restore,
              child: Text(
                _restoring ? '…' : l.paywallRestoreButton,
                style: TextStyle(color: primary, fontSize: 13)),
            ),
            SizedBox(height: 8 + MediaQuery.of(context).padding.bottom),
          ]),
        ),
      ),
    );
  }
}
