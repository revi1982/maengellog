import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../config/app_config.dart';

class PdfService {
  static Future<void> exportAndShare({
    required List<Map<String, dynamic>> entries,
  }) async {
    final doc  = pw.Document();
    final font = await PdfGoogleFonts.interRegular();
    final bold = await PdfGoogleFonts.interBold();
    final now  = DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now());

    const hidden = {'id', 'photo_path', 'updated_at'};

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(36),
        header: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('${AppConfig.appName} – Protokoll',
              style: pw.TextStyle(font: bold, fontSize: 18)),
            pw.SizedBox(height: 4),
            pw.Text('Erstellt am: $now | Einträge gesamt: ${entries.length}',
              style: pw.TextStyle(font: font, fontSize: 9, color: PdfColors.grey600)),
            pw.Divider(thickness: 0.5, color: PdfColors.grey400),
            pw.SizedBox(height: 6),
          ],
        ),
        footer: (ctx) => pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(AppConfig.appName,
              style: pw.TextStyle(font: font, fontSize: 8, color: PdfColors.grey500)),
            pw.Text('Seite ${ctx.pageNumber} / ${ctx.pagesCount}',
              style: pw.TextStyle(font: font, fontSize: 8, color: PdfColors.grey500)),
          ],
        ),
        build: (_) => entries.asMap().entries.map((e) {
          final i     = e.key;
          final entry = e.value;
          final fields = entry.entries.where((f) => !hidden.contains(f.key) && f.value != null);
          return pw.Container(
            margin: const pw.EdgeInsets.only(bottom: 10),
            padding: const pw.EdgeInsets.all(10),
            decoration: pw.BoxDecoration(
              color: i.isEven ? const PdfColor(0.96, 0.96, 0.97) : PdfColors.white,
              borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
              border: pw.Border.all(color: PdfColors.grey300, width: 0.5),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: fields.map((f) => pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 2),
                child: pw.RichText(text: pw.TextSpan(children: [
                  pw.TextSpan(text: '${f.key}: ', style: pw.TextStyle(font: bold, fontSize: 9)),
                  pw.TextSpan(text: '${f.value}', style: pw.TextStyle(font: font, fontSize: 9)),
                ])),
              )).toList(),
            ),
          );
        }).toList(),
      ),
    );

    await Printing.sharePdf(
      bytes: await doc.save(),
      filename: '${AppConfig.appName.replaceAll(' ', '_')}_Protokoll.pdf',
    );
  }
}
