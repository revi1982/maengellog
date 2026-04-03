import 'dart:io';                          // PFLICHT: ohne diesen Import → Compile-Fehler
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/database/database_helper.dart';
import '../../l10n/app_localizations.dart';

class EntryFormScreen extends StatefulWidget {
  final VoidCallback             onSaved;
  final Map<String, dynamic>?    existingEntry;
  const EntryFormScreen({super.key, required this.onSaved, this.existingEntry});

  @override
  State<EntryFormScreen> createState() => _EntryFormScreenState();
}

class _EntryFormScreenState extends State<EntryFormScreen> {
  final _descCtrl     = TextEditingController();
  final _locationCtrl = TextEditingController();
  final _witnessCtrl  = TextEditingController();
  final _notesCtrl    = TextEditingController();
  String? _photoPath;
  bool    _saving = false;

  @override
  void initState() {
    super.initState();
    final e = widget.existingEntry;
    if (e != null) {
      _descCtrl.text     = (e['description']  as String?) ?? '';
      _locationCtrl.text = (e['location']     as String?) ?? '';
      _witnessCtrl.text  = (e['witnesses']    as String?) ?? '';
      _notesCtrl.text    = (e['notes']        as String?) ?? '';
      _photoPath         = e['photo_path']    as String?;
    }
  }

  @override
  void dispose() {
    _descCtrl.dispose(); _locationCtrl.dispose();
    _witnessCtrl.dispose(); _notesCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) return;
    final img = await ImagePicker().pickImage(
        source: ImageSource.camera, imageQuality: 80);
    if (img != null && mounted) {
      setState(() => _photoPath = img.path);
    }
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    final data = <String, dynamic>{
      'description':     _descCtrl.text.trim(),
      'location':        _locationCtrl.text.trim(),
      'witnesses':       _witnessCtrl.text.trim(),
      'notes':           _notesCtrl.text.trim(),
      'photo_path':      _photoPath,
      'entry_timestamp': DateTime.now().toIso8601String(),
    };
    if (widget.existingEntry != null) {
      await DatabaseHelper.instance.updateEntry(
          widget.existingEntry!['id'] as int, data);
    } else {
      await DatabaseHelper.instance.insertEntry(data);
    }
    if (mounted) setState(() => _saving = false);
    widget.onSaved();
  }

  @override
  Widget build(BuildContext context) {
    final l       = AppLocalizations.of(context)!;
    final primary = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Drag Handle
          Center(child: Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 36, height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFDDDDE8),
              borderRadius: BorderRadius.circular(2),
            ),
          )),
          Text(
            widget.existingEntry == null ? l.actionAdd : l.actionEdit,
            style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF111122)),
          ),
          const SizedBox(height: 20),

          _FieldLabel(l.fieldDescription, primary),
          const SizedBox(height: 6),
          TextField(
            controller: _descCtrl, maxLines: 3,
            decoration: InputDecoration(hintText: l.fieldDescriptionHint),
          ),
          const SizedBox(height: 16),

          _FieldLabel(l.fieldPhoto, primary),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: _pickPhoto,
            child: Container(
              height: _photoPath != null ? 160 : 56,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F1F8),
                borderRadius: BorderRadius.circular(14),
                border: _photoPath == null
                    ? Border.all(color: const Color(0xFFE0E0ED))
                    : null,
              ),
              child: _photoPath != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.file(
                        File(_photoPath!),
                        fit: BoxFit.cover,
                      ),
                    )
                  : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(Icons.camera_alt_outlined, color: primary, size: 20),
                      const SizedBox(width: 8),
                      Text(l.fieldPhoto,
                          style: TextStyle(color: primary, fontWeight: FontWeight.w600)),
                    ]),
            ),
          ),
          const SizedBox(height: 16),

          _FieldLabel(l.fieldLocation, primary),
          const SizedBox(height: 6),
          TextField(
            controller: _locationCtrl,
            decoration: InputDecoration(hintText: l.fieldLocationHint),
          ),
          const SizedBox(height: 16),

          _FieldLabel(l.fieldWitnesses, primary),
          const SizedBox(height: 6),
          TextField(
            controller: _witnessCtrl,
            decoration: InputDecoration(hintText: l.fieldWitnessesHint),
          ),
          const SizedBox(height: 16),

          _FieldLabel(l.fieldNotes, primary),
          const SizedBox(height: 6),
          TextField(
            controller: _notesCtrl, maxLines: 2,
            decoration: InputDecoration(hintText: l.fieldNotesHint),
          ),
          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity, height: 56,
            child: ElevatedButton(
              onPressed: _saving ? null : _save,
              child: _saving
                  ? const SizedBox(
                      width: 20, height: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white))
                  : Text(l.actionSave,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700)),
            ),
          ),
        ]),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  final Color  color;
  const _FieldLabel(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(text.toUpperCase(), style: TextStyle(
      fontSize: 10, fontWeight: FontWeight.w700,
      letterSpacing: 0.8, color: color,
    ));
  }
}
