import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/services/billing_service.dart';
import '../../l10n/app_localizations.dart';
import '../legal/legal_text_screen.dart';
import '../onboarding/onboarding_screen.dart';
import '../paywall/paywall_screen.dart';

class MaengelLogSettingsScreen extends StatelessWidget {
  const MaengelLogSettingsScreen({super.key});

  void _openLegal(BuildContext context, String title, String legalKey) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MaengelLogLegalTextScreen(title: title, legalKey: legalKey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(l.settingsTitle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          _Section(title: l.sectionPremium, children: [
            _Tile(
              icon: Icons.star_outline,
              iconColor: primary,
              label: l.settingsPurchase,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const MaengelLogPaywallScreen())),
            ),
            _Tile(
              icon: Icons.restore,
              iconColor: primary,
              label: l.settingsRestore,
              onTap: () => BillingService.instance.restore(),
            ),
          ]),
          const SizedBox(height: 16),
          _Section(title: l.sectionLegal, children: [
            _Tile(
              icon: Icons.info_outline,
              label: l.settingsImpressum,
              onTap: () => _openLegal(context, l.settingsImpressum, 'impressum'),
            ),
            _Tile(
              icon: Icons.privacy_tip_outlined,
              label: l.settingsDatenschutz,
              onTap: () =>
                  _openLegal(context, l.settingsDatenschutz, 'datenschutz'),
            ),
            _Tile(
              icon: Icons.gavel_outlined,
              label: l.settingsAgb,
              onTap: () => _openLegal(context, l.settingsAgb, 'agb'),
            ),
          ]),
          const SizedBox(height: 16),
          _Section(title: l.navSettings, children: [
            _Tile(
              icon: Icons.replay_outlined,
              label: l.settingsRepeatOnboarding,
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('onboarding_done', false);
                if (context.mounted) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const MaengelLogOnboardingScreen()),
                    (route) => false,
                  );
                }
              },
            ),
          ]),
          const SizedBox(height: 16),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snap) {
              final v = snap.data?.version ?? '…';
              final b = snap.data?.buildNumber ?? '';
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text('${l.settingsVersion} $v ($b)',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 12, color: Color(0xFF9090A8))),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _Section({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
        child: Text(title,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              color: Color(0xFF9090A8),
            )),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                color: Color(0x0F000000), blurRadius: 8, offset: Offset(0, 2))
          ],
        ),
        child: Column(children: children),
      ),
    ]);
  }
}

class _Tile extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String label;
  final VoidCallback onTap;
  const _Tile(
      {required this.icon,
      this.iconColor,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final clr = iconColor ?? const Color(0xFF9090A8);
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: clr.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 18, color: clr),
      ),
      title: Text(label,
          style:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right,
          color: Color(0xFF9090A8), size: 18),
      onTap: onTap,
    );
  }
}
