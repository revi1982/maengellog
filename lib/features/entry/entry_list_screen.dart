import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../core/config/app_config.dart';
import '../../core/database/database_helper.dart';
import '../../core/services/ad_service.dart';
import '../../l10n/app_localizations.dart';
import 'entry_detail_screen.dart';

class EntryListScreen extends StatefulWidget {
  final VoidCallback? onRefresh;
  const EntryListScreen({super.key, this.onRefresh});

  @override
  State<EntryListScreen> createState() => _EntryListScreenState();
}

class _EntryListScreenState extends State<EntryListScreen> {
  List<Map<String, dynamic>> _entries = [];
  NativeAd? _nativeAd;
  bool      _nativeAdLoaded = false;

  @override
  void initState() { super.initState(); _load(); _loadNativeAd(); }

  @override
  void dispose() { _nativeAd?.dispose(); super.dispose(); }

  Future<void> _load() async {
    final entries = await DatabaseHelper.instance.getAllEntries();
    if (mounted) setState(() => _entries = entries);
  }

  Future<void> _loadNativeAd() async {
    if (AdService.isPremium) return;
    final ad = NativeAd(
      adUnitId: AppConfig.admobNativeId,
      factoryId: 'listTile',
      listener: NativeAdListener(
        onAdLoaded: (_) {
          if (mounted) setState(() => _nativeAdLoaded = true);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          if (mounted) setState(() => _nativeAdLoaded = false);
          debugPrint('Native ad failed: $error');
        },
      ),
      request: const AdRequest(),
    );
    await ad.load();
    if (mounted) setState(() => _nativeAd = ad);
  }

  bool get _showNativeAd =>
      _nativeAdLoaded && _nativeAd != null &&
      !AdService.isPremium && _entries.length >= 4;

  String _title(Map<String, dynamic> e) {
    final cat  = e['category']    as String?;
    final desc = e['description'] as String?;
    if (cat  != null && cat.isNotEmpty)  return cat;
    if (desc != null && desc.isNotEmpty) {
      return desc.length > 40 ? '${desc.substring(0, 40)}…' : desc;
    }
    return 'Eintrag';
  }

  String _meta(Map<String, dynamic> e) {
    final ts = (e['entry_timestamp'] ?? e['created_at'] ?? '') as String;
    if (ts.isEmpty) return '';
    try {
      final dt = DateTime.parse(ts);
      final d  = dt.day.toString().padLeft(2, '0');
      final m  = dt.month.toString().padLeft(2, '0');
      final h  = dt.hour.toString().padLeft(2, '0');
      final mi = dt.minute.toString().padLeft(2, '0');
      return '$d.$m. $h:$mi';
    } catch (_) {
      return ts.length > 16 ? ts.substring(0, 16) : ts;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l       = AppLocalizations.of(context)!;
    final primary = Theme.of(context).colorScheme.primary;
    final accent  = Theme.of(context).colorScheme.secondary;

    if (_entries.isEmpty) {
      return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Icon(AppConfig.appIcon, size: 48, color: Color(0xFFCCCCDD)),
          const SizedBox(height: 16),
          Text(l.noEntriesTitle, style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF374151))),
          const SizedBox(height: 6),
          Text(l.noEntriesSubtitle, style: const TextStyle(
            fontSize: 13, color: Color(0xFF9090A8))),
        ]),
      );
    }

    // Native ad is inserted at position 4 (after 4th entry)
    final totalItems = _entries.length + (_showNativeAd ? 1 : 0);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: Text(l.sectionHistory, style: const TextStyle(
          fontSize: 10, fontWeight: FontWeight.w700,
          letterSpacing: 1.2, color: Color(0xFF9090A8),
        )),
      ),
      Expanded(
        child: RefreshIndicator(
          onRefresh: () async { await _load(); widget.onRefresh?.call(); },
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 100),
            itemCount: totalItems,
            itemBuilder: (ctx, i) {
              // Native ad at position 4
              if (_showNativeAd && i == 4) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [BoxShadow(
                      color: Color(0x08000000), blurRadius: 4, offset: Offset(0, 1),
                    )],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: AdWidget(ad: _nativeAd!),
                  ),
                );
              }

              final entryIndex = (_showNativeAd && i > 4) ? i - 1 : i;
              final e      = _entries[entryIndex];
              final isEven = entryIndex.isEven;
              final iconBg  = isEven
                  ? primary.withValues(alpha: 0.10)
                  : accent.withValues(alpha: 0.12);
              final iconClr = isEven ? primary : accent;

              return GestureDetector(
                onTap: () async {
                  final deleted = await Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                        builder: (_) => EntryDetailScreen(entry: e)),
                  );
                  if (deleted == true) { _load(); widget.onRefresh?.call(); }
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [BoxShadow(
                      color: Color(0x08000000), blurRadius: 4, offset: Offset(0, 1),
                    )],
                  ),
                  child: Row(children: [
                    Container(
                      width: 40, height: 40,
                      decoration: BoxDecoration(
                        color: iconBg,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(AppConfig.appIcon, size: 18, color: iconClr),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_title(e), style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600,
                            color: Color(0xFF111122))),
                          const SizedBox(height: 2),
                          Text(_meta(e), style: const TextStyle(
                            fontSize: 12, color: Color(0xFF9090A8))),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right,
                        color: Color(0xFF9090A8), size: 18),
                  ]),
                ),
              );
            },
          ),
        ),
      ),
    ]);
  }
}
