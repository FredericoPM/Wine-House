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
    return pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      orientation: PageOrientation.landscape,
      margin: const pw.EdgeInsets.fromLTRB(5,10,5,10),
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
      "Regiao",
      "Tipo",
      "Safra",
      "R.P.",
      "W.S.",
      "Beber R.P.",
      "Estoque",
      "Etiqueta",
    ];
    return pw.Table.fromTextArray(
      border: null,
      cellAlignment: pw.Alignment.centerLeft,
      headerDecoration: pw.BoxDecoration(
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
        color: PdfColor.fromHex("942641"),
      ),
      headerHeight: 25,
      cellHeight: 40,
      columnWidths: { 
        0 : FixedColumnWidth(400),
        1 : FixedColumnWidth(100),
        2 : FixedColumnWidth(80),
        3 : FixedColumnWidth(80),
        4 : FixedColumnWidth(80),
        5 : FixedColumnWidth(80),
        6 : FixedColumnWidth(100),
        7 : FixedColumnWidth(80),
        8 : FixedColumnWidth(250),
      },
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.centerLeft,
        3: pw.Alignment.center,
        4: pw.Alignment.center,
        5: pw.Alignment.center,
        6: pw.Alignment.center,
        7: pw.Alignment.center,
        8: pw.Alignment.centerLeft,
      },
      headerAlignments: {
        0: pw.Alignment.center,
        1: pw.Alignment.center,
        2: pw.Alignment.center,
        3: pw.Alignment.center,
        4: pw.Alignment.center,
        5: pw.Alignment.center,
        6: pw.Alignment.center,
        7: pw.Alignment.center,
        8: pw.Alignment.center,
      },
      headerStyle: pw.TextStyle(
        color: PdfColors.white,
        fontSize: 10,
        fontWeight: pw.FontWeight.bold,
      ),
      cellStyle: const pw.TextStyle(
        color: PdfColors.black,
        fontSize: 10,
      ),
      
      rowDecoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: PdfColors.black,
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
          (col) {
            switch (col) {
              case 0:
                return vinhos[row].nome;
              break;
              case 1:
                return vinhos[row].regiao;
              break;
              case 2:
                return vinhos[row].tipo;
              break;
              case 3:
                return vinhos[row].safra.toString();
              break;
              case 4:
                return vinhos[row].notaRP == "" ? "-" : vinhos[row].notaRP;
              break;
              case 5:
                return vinhos[row].notaWS == "" ? "-" : vinhos[row].notaWS;
              break;
              case 6:
                return vinhos[row].beberRP == "Não informado" ? "-" : vinhos[row].beberRP;
              break;
              case 7:
                return vinhos[row].quantidade.toString();
              break;
              case 8:
                return vinhos[row].etiqueta;
              break;
              default:
                return "teste";
            }
          },
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