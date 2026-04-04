import 'package:flutter/material.dart';
import '../../core/database/database_helper.dart';
import '../../l10n/app_localizations.dart';

class MaengelLogEntryDetailScreen extends StatelessWidget {
  final Map<String, dynamic> entry;
  const MaengelLogEntryDetailScreen({super.key, required this.entry});

  static const _hidden = {'id', 'photo_path', 'updated_at'};

  @override
  Widget build(BuildContext context) {
    final l       = AppLocalizations.of(context)!;
    final primary = Theme.of(context).colorScheme.primary;

    final fields = entry.entries
        .where((e) => !_hidden.contains(e.key) && e.value != null)
        .toList();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(l.sectionDetails,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, size: 20),
            onPressed: () => _confirmDelete(context, l),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: fields.length,
        itemBuilder: (_, i) => _Row(
          label:   fields[i].key,
          value:   '${fields[i].value}',
          primary: primary,
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, AppLocalizations l) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title:   Text(l.confirmDeleteTitle),
        content: Text(l.confirmDeleteMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l.actionCancel),
          ),
          TextButton(
            onPressed: () async {
              await DatabaseHelper.instance.deleteEntry(entry['id'] as int);
              if (context.mounted) {
                Navigator.pop(context);
                Navigator.pop(context, true);
              }
            },
            child: Text(l.confirmDeleteConfirm,
                style: const TextStyle(color: Color(0xFFDC2626))),
          ),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String label, value;
  final Color  primary;
  const _Row({required this.label, required this.value, required this.primary});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(
          color: Color(0x08000000), blurRadius: 4, offset: Offset(0, 1),
        )],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label.toUpperCase(), style: TextStyle(
          fontSize: 10, fontWeight: FontWeight.w700,
          letterSpacing: 0.8, color: primary,
        )),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(
          fontSize: 14, color: Color(0xFF111122))),
      ]),
    );
  }
}
