import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWid;
import 'package:printing/printing.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PdfPreview(
      build: (format) => createPdf(format),
    ));
  }

  Future<Uint8List> createPdf(PdfPageFormat format) async {
    final pdf = pdfWid.Document(version: PdfVersion.pdf_1_4, compress: true);
    pdf.addPage(pdfWid.Page(
        // pageFormat: PdfPageFormat((80 * (72.0 / 25.4)), 600,
        //     marginAll: 5 * (72.0 / 25.4)),
      pageFormat: format,
        build: (ctx) => pdfWid.Column(
            children: [pdfWid.SizedBox(height: 200), pdfWid.FlutterLogo()])));
    return pdf.save();
  }
}
