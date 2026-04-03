import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../core/config/app_config.dart';
import '../../core/database/database_helper.dart';
import '../../core/services/ad_service.dart';
import '../../l10n/app_localizations.dart';
import '../../core/services/billing_service.dart';
import '../../core/services/pdf_service.dart';
import '../entry/entry_form_screen.dart';
import '../entry/entry_list_screen.dart';
import '../paywall/paywall_screen.dart';
import '../settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? _banner;
  int    _total      = 0;
  int    _week       = 0;
  String _lastDate   = '–';
  int    _listRefKey = 0;
  bool   _rewardedReady = false;

  @override
  void initState() {
    super.initState();
    _loadStats();
    _loadAd();
    _loadRewarded();
  }

  Future<void> _loadStats() async {
    final total = await DatabaseHelper.instance.getEntryCount();
    final week  = await DatabaseHelper.instance.getEntryCountSince(
        DateTime.now().subtract(const Duration(days: 7)));
    final last     = await DatabaseHelper.instance.getLastEntry();
    final lastTs   = last != null ? (last['created_at'] as String? ?? '') : '';
    String lastDate = '–';
    if (lastTs.isNotEmpty) {
      try {
        final dt = DateTime.parse(lastTs);
        lastDate =
            '${dt.day.toString().padLeft(2,'0')}.${dt.month.toString().padLeft(2,'0')}.';
      } catch (_) {}
    }
    if (mounted) setState(() { _total = total; _week = week; _lastDate = lastDate; });
  }

  Future<void> _loadAd() async {
    final ad = await AdService.loadBanner();
    if (mounted) setState(() => _banner = ad);
  }

  Future<void> _loadRewarded() async {
    await AdService.loadRewarded();
    if (mounted) setState(() => _rewardedReady = AdService.isRewardedReady);
  }

  Future<void> _watchAdForReward() async {
    final l = AppLocalizations.of(context)!;
    if (!AdService.isRewardedReady) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l.adRewardNotAvailable)),
        );
      }
      return;
    }
    await AdService.showRewarded(
      onRewarded: () async {
        await AdService.applyBannerHideReward();
        AdService.disposeBanner();
        if (mounted) {
          setState(() { _banner = null; _rewardedReady = false; });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l.adRewardSuccess)),
          );
        }
      },
    );
  }

  @override
  void dispose() { AdService.disposeBanner(); super.dispose(); }

  void _openForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (_) => EntryFormScreen(onSaved: () {
        Navigator.pop(context);
        _loadStats().then((_) {
          if (!mounted) return;
          setState(() => _listRefKey++);
          if (_total > 0 && _total % 5 == 0 && !AdService.isPremium) {
            Future.delayed(const Duration(milliseconds: 600), () {
              if (!mounted) return;
              AdService.showRewardedInterstitial(onRewarded: () async {
                await AdService.applyBannerHideReward();
                if (mounted) setState(() => _banner = null);
              });
            });
          }
        });
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l       = AppLocalizations.of(context)!;
    final primary = Theme.of(context).colorScheme.primary;
    final accent  = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      body: SafeArea(child: Column(children: [

        // ── HEADER ─────────────────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(children: [
            Container(
              width: 44, height: 44,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(12)),
              child: const Icon(AppConfig.appIcon, size: 22, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(AppConfig.appName, style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF111122))),
              Text(
                '$_total ${l.statEntries}'.toUpperCase(),
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600,
                    letterSpacing: 0.6, color: primary),
              ),
            ]),
            const Spacer(),
            _HBtn(icon: Icons.download_outlined, onTap: () async {
              if (!BillingService.instance.isPremium) {
                if (context.mounted) {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const PaywallScreen()));
                }
                return;
              }
              final entries = await DatabaseHelper.instance.getAllEntries();
              if (context.mounted) await PdfService.exportAndShare(entries: entries);
            }),
            const SizedBox(width: 8),
            _HBtn(icon: Icons.settings_outlined, onTap: () =>
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SettingsScreen()))),
          ]),
        ),

        // ── STATS GRID ─────────────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            Row(children: [
              Expanded(child: _Stat(i: 0, p: primary, a: accent,
                icon: Icons.timer_outlined,       label: l.statTotal,
                value: '$_total', caption: l.statEntries)),
              const SizedBox(width: 10),
              Expanded(child: _Stat(i: 1, p: primary, a: accent,
                icon: Icons.trending_up_outlined, label: l.statThisWeek,
                value: '$_week',  caption: l.statEntries)),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(child: _Stat(i: 2, p: primary, a: accent,
                icon: Icons.calendar_today_outlined, label: l.statLastEntry,
                value: _lastDate, caption: l.statLastEntry)),
              const SizedBox(width: 10),
              Expanded(child: _Stat(i: 3, p: primary, a: accent,
                icon: AppConfig.appIcon, label: l.sectionHistory,
                value: '$_total', caption: l.statTotal)),
            ]),
          ]),
        ),

        const SizedBox(height: 12),

        // ── BANNER + REWARDED ──────────────────────────────────────────────
        if (!AdService.isPremium) ...[
          if (_banner != null)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: _banner!.size.height.toDouble(),
              width:  _banner!.size.width.toDouble(),
              child: AdWidget(ad: _banner!),
            ),
          if (_banner != null && _rewardedReady)
            const SizedBox(height: 4),
          if (_rewardedReady)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: _watchAdForReward,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5FB),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFE0E0EE)),
                  ),
                  child: Row(children: [
                    Icon(Icons.play_circle_outline, size: 18, color: primary),
                    const SizedBox(width: 8),
                    Expanded(child: Text(l.adRewardButton,
                        style: TextStyle(fontSize: 13,
                            fontWeight: FontWeight.w600, color: primary))),
                    Icon(Icons.chevron_right, size: 18,
                        color: primary.withValues(alpha: 0.5)),
                  ]),
                ),
              ),
            ),
          if (_banner != null || _rewardedReady)
            const SizedBox(height: 8),
        ],

        // ── ENTRY LIST ─────────────────────────────────────────────────────
        Expanded(child: EntryListScreen(
          key: ValueKey(_listRefKey), onRefresh: _loadStats)),
      ])),

      // ── BOTTOM ACTION BAR ─────────────────────────────────────────────────
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(
            16, 12, 16, 16 + MediaQuery.of(context).padding.bottom),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(
              color: Color(0x12000000), blurRadius: 12, offset: Offset(0, -3))],
        ),
        child: SizedBox(
          width: double.infinity, height: 56,
          child: ElevatedButton.icon(
            onPressed: _openForm,
            icon: const Icon(Icons.add, size: 20),
            label: Text(l.actionAdd, style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }
}

class _HBtn extends StatelessWidget {
  final IconData icon; final VoidCallback onTap;
  const _HBtn({required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 40, height: 40,
      decoration: BoxDecoration(
          color: const Color(0xFFF0F1F8),
          borderRadius: BorderRadius.circular(12)),
      child: Icon(icon, size: 18, color: const Color(0xFF6B6B8D)),
    ),
  );
}

class _Stat extends StatelessWidget {
  final int i; final Color p, a;
  final IconData icon; final String label, value, caption;
  const _Stat({required this.i, required this.p, required this.a,
      required this.icon, required this.label,
      required this.value, required this.caption});

  @override
  Widget build(BuildContext context) {
    final bg  = i.isEven ? p.withValues(alpha: 0.10) : a.withValues(alpha: 0.12);
    final clr = i.isEven ? p : a;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(
            color: Color(0x0F000000), blurRadius: 8, offset: Offset(0, 2))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(
            width: 32, height: 32,
            decoration: BoxDecoration(
                color: bg, borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, size: 16, color: clr),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(label.toUpperCase(),
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600,
                letterSpacing: 0.8, color: Color(0xFF9090A8)),
            overflow: TextOverflow.ellipsis,
          )),
        ]),
        const SizedBox(height: 10),
        Text(value, style: const TextStyle(fontSize: 26,
            fontWeight: FontWeight.w800, color: Color(0xFF111122), height: 1.0)),
        const SizedBox(height: 2),
        Text(caption, style: const TextStyle(
            fontSize: 12, color: Color(0xFF9090A8))),
      ]),
    );
  }
}
