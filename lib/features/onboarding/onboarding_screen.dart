import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/config/app_config.dart';
import '../../l10n/app_localizations.dart';
import '../legal/legal_screen.dart';
// HomeScreen-Import kommt in Prompt 5 — hier noch NICHT

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _ctrl = PageController();
  int  _page  = 0;
  bool _dsgvoAccepted = false;
  static const int _total = 5;

  void _next() {
    if (_page < _total - 1) {
      _ctrl.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _finish() async {
    if (!_dsgvoAccepted) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_done', true);
    if (!mounted) return;
    // Stub-Navigation — Prompt 5 ersetzt dies durch HomeScreen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const Scaffold(
          backgroundColor: Color(0xFFF4F5FA),
          body: Center(
            child: Text('Home wird in Prompt 5 gebaut',
                style: TextStyle(color: Color(0xFF9090A8))),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final l       = AppLocalizations.of(context)!;
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F5FA),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: PageView(
              controller: _ctrl,
              onPageChanged: (i) => setState(() => _page = i),
              children: [
                _Page(icon: AppConfig.appIcon,              primary: primary, headline: l.onboardingHeadline0, body: l.onboardingBody0),
                _Page(icon: Icons.photo_camera_outlined,    primary: primary, headline: l.onboardingHeadline1, body: l.onboardingBody1),
                _Page(icon: Icons.lock_outline,             primary: primary, headline: l.onboardingHeadline2, body: l.onboardingBody2),
                _Page(icon: Icons.picture_as_pdf_outlined,  primary: primary, headline: l.onboardingHeadline3, body: l.onboardingBody3),
                _DsgvoPage(
                  primary: primary,
                  l: l,
                  accepted: _dsgvoAccepted,
                  onChanged: (v) => setState(() => _dsgvoAccepted = v ?? false),
                  onLinkTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LegalScreen(
                      title: l.onboardingPrivacyTitle,
                      url: AppConfig.datenschutzUrl,
                    )),
                  ),
                ),
              ],
            ),
          ),
          // Page Indicator
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_total, (i) {
                final active = i == _page;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: active ? 24 : 8, height: 8,
                  decoration: BoxDecoration(
                    color: active ? primary : const Color(0xFFCCCCDD),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
          // CTA Button
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 24 + MediaQuery.of(context).padding.bottom),
            child: SizedBox(
              width: double.infinity, height: 56,
              child: ElevatedButton(
                onPressed: _page < _total - 1
                    ? _next
                    : (_dsgvoAccepted ? _finish : null),
                child: Text(
                  _page < _total - 1 ? l.onboardingNext : l.onboardingStart,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

// ── Einzelner Content-Screen ──────────────────────────────────────────────────
class _Page extends StatelessWidget {
  final IconData icon;
  final Color    primary;
  final String   headline, body;
  const _Page({required this.icon, required this.primary,
      required this.headline, required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 80, height: 80,
          decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(22)),
          child: Icon(icon, size: 38, color: Colors.white),
        ),
        const SizedBox(height: 32),
        Text(headline, textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800,
                color: Color(0xFF111122), height: 1.2)),
        const SizedBox(height: 16),
        Text(body, textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, color: Color(0xFF6B6B8D), height: 1.5)),
      ]),
    );
  }
}

// ── DSGVO-Screen (Screen 5) ───────────────────────────────────────────────────
class _DsgvoPage extends StatelessWidget {
  final Color primary;
  final bool accepted;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onLinkTap;
  final AppLocalizations l;
  const _DsgvoPage({required this.primary, required this.accepted,
      required this.onChanged, required this.onLinkTap, required this.l});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 80, height: 80,
          decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(22)),
          child: const Icon(Icons.privacy_tip_outlined, size: 38, color: Colors.white),
        ),
        const SizedBox(height: 32),
        Text(l.onboardingPrivacyTitle, textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800,
                color: Color(0xFF111122), height: 1.2)),
        const SizedBox(height: 16),
        Text(l.onboardingPrivacyBody, textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, color: Color(0xFF6B6B8D), height: 1.5)),
        const SizedBox(height: 28),

        // ── Checkbox-Block ────────────────────────────────────────────────────
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: accepted ? primary : const Color(0xFFE0E0ED),
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: accepted,
                    onChanged: onChanged,
                    activeColor: primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        l.onboardingPrivacyConsent,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF374151),
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Link-Button separat unter dem Checkbox-Text
              Padding(
                padding: const EdgeInsets.only(left: 48, bottom: 4),
                child: GestureDetector(
                  onTap: onLinkTap,
                  child: Text(
                    l.onboardingPrivacyLink,
                    style: TextStyle(
                      fontSize: 13,
                      color: primary,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
