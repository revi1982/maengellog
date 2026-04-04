import 'package:flutter/material.dart';
import '../../core/services/legal_service.dart';

export '../../core/services/legal_service.dart' show LegalSection;

class MaengelLogLegalTextScreen extends StatefulWidget {
  final String title;
  final String legalKey; // 'impressum' | 'datenschutz' | 'agb'

  const MaengelLogLegalTextScreen({
    super.key,
    required this.title,
    required this.legalKey,
  });

  @override
  State<MaengelLogLegalTextScreen> createState() => _MaengelLogLegalTextScreenState();
}

class _MaengelLogLegalTextScreenState extends State<MaengelLogLegalTextScreen> {
  List<LegalSection>? _sections;
  bool _error = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final sections = await LegalService.getSections(widget.legalKey);
      if (mounted) setState(() => _sections = sections);
    } catch (_) {
      if (mounted) setState(() => _error = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF4F5FB),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF111122),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: _buildBody(primary),
    );
  }

  Widget _buildBody(Color primary) {
    if (_error) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.wifi_off_outlined, size: 48, color: Colors.grey[400]),
            const SizedBox(height: 16),
            const Text('Inhalt konnte nicht geladen werden.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF6B6B8D))),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                setState(() { _error = false; _sections = null; });
                _load();
              },
              child: const Text('Erneut versuchen'),
            ),
          ]),
        ),
      );
    }

    if (_sections == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_sections!.isEmpty) {
      return const Center(
        child: Text('Kein Inhalt verfügbar.',
            style: TextStyle(color: Color(0xFF6B6B8D))),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _sections!.length,
      itemBuilder: (_, i) => _SectionCard(
        section: _sections![i],
        primary: primary,
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final LegalSection section;
  final Color primary;
  const _SectionCard({required this.section, required this.primary});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
              color: Color(0x08000000), blurRadius: 4, offset: Offset(0, 1)),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (section.heading != null) ...[
          Text(
            section.heading!.toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.6,
              color: primary,
            ),
          ),
          const SizedBox(height: 8),
        ],
        Text(
          section.body,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF4A4A6A),
            height: 1.55,
          ),
        ),
      ]),
    );
  }
}
