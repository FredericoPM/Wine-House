import 'dart:io';
import 'dart:async';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

import '../models/vinho.dart';

class PdfGenerator{
  var _pdf;
  Directory _directory;
  String _path;
  List<Vinho> vinhos;
  Future<void> loadDirectory() async {
    _directory = await getApplicationDocumentsDirectory();
    _path = '${_directory.path}/example.pdf';
  }

  PdfGenerator(this.vinhos){
     loadDirectory();
  }
  get path{
    return _path;
  }
  Future<pw.PageTheme> _theme() async {
    final botomImage = await rootBundle.loadString('assets/images/botton_image.svg');
    return pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      orientation: PageOrientation.landscape,
      // theme: pw.ThemeData.withFont(
      //   base: pw.Font.ttf(await rootBundle.load('assets/open-sans.ttf')),
      //   bold: pw.Font.ttf(await rootBundle.load('assets/open-sans-bold.ttf')),
      //   icons: pw.Font.ttf(await rootBundle.load('assets/material.ttf')),
      // ),
    );
  }

  pw.Widget _contentTable(pw.Context context) {
    const tableHeaders = [
      "Nome",
      "Pais",
      "Regiao",
      "Tipo",
      "Safra",
      "R.P.",
      "W.S.",
      "Beber R.P.",
      "Etiqueta",
      "Estoque"
    ];
    return pw.Table.fromTextArray(
      border: null,
      cellAlignment: pw.Alignment.centerLeft,
      headerDecoration: pw.BoxDecoration(
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
        color: PdfColor.fromHex("0xFF942641"),
      ),
      headerHeight: 25,
      cellHeight: 40,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.centerLeft,
        3: pw.Alignment.centerLeft,
        4: pw.Alignment.center,
        5: pw.Alignment.center,
        6: pw.Alignment.center,
        7: pw.Alignment.center,
        8: pw.Alignment.center,
        9: pw.Alignment.centerRight,
      },
      headerStyle: pw.TextStyle(
        color: PdfColor.fromHex("0xFF000000"),
        fontSize: 10,
        fontWeight: pw.FontWeight.bold,
      ),
      cellStyle: pw.TextStyle(
        color: PdfColor.fromHex("0xFFffffff"),
        fontSize: 10,
      ),
      rowDecoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: PdfColor.fromHex("0xFFffffff"),
            width: .5,
          ),
        ),
      ),
      headers: List<String>.generate(
        tableHeaders.length,
        (col) => tableHeaders[col],
      ),
      data: List<List<String>>.generate(
        vinhos.length,
        (row) => List<String>.generate(
          tableHeaders.length,  
          (col) => "teste",
        ),
      ),
    );
  }

  Future<void> savePDF() async {
    _pdf = pw.Document();
    final pageTheme = await _theme();
    _pdf.addPage(
      pw.MultiPage(
        pageTheme: pageTheme,
        build: (pw.Context context) => [
          _contentTable(context),
        ]
      ),
    );

    try{
      final file = await File(_path);
      await file.writeAsBytes(await _pdf.save());
    }catch(e){
      print(e);
    }
  }
}