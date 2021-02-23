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
  List<List<String>> _data = [];
  var image;
  bool ready = false;
  Future<void> _loadDirectory() async {
    image = await rootBundle.loadString("assets/images/bandeiras/franca.svg");
    _directory = await getApplicationDocumentsDirectory();
    _path = '${_directory.path}/carta_de_vinhos.pdf';
  }
  Future<void> _sortData() async{
    vinhos.sort((a, b) {
     final pais = a.pais.compareTo(b.pais);
     final regiao = a.regiao.compareTo(b.regiao);
     final nome = a.nome.compareTo(b.nome);
     return pais == 0 ? regiao  == 0 ? nome == 0 ? a.safra.compareTo(b.safra) : a.nome.compareTo(b.nome) : a.regiao.compareTo(b.regiao) : a.pais.compareTo(b.pais);
    });
  }
  Future<void> _formatData() async{
    _data = [];
    List<String> aux = [];
    for(int i = 0; i<vinhos.length; i++){
      for(int j=0; j<9;j++){
        switch (j) {
          case 0:
            aux.add(vinhos[i].nome);
          break;
          case 1:
            aux.add(vinhos[i].regiao);
          break;
          case 2:
            aux.add(vinhos[i].tipo);
          break;
          case 3:
            aux.add(vinhos[i].safra.toString());
          break;
          case 4:
            aux.add(vinhos[i].notaRP == "" ? "-" : vinhos[i].notaRP);
          break;
          case 5:
            aux.add(vinhos[i].notaWS == "" ? "-" : vinhos[i].notaWS);
          break;
          case 6:
            aux.add(vinhos[i].beberRP == "Não informado" ? "-" : vinhos[i].beberRP);
          break;
          case 7:
            aux.add(vinhos[i].etiqueta);
          break;
          case 8:
            aux.add(vinhos[i].quantidade.toString());
          break;
        }
      }
      _data.add(aux);
      aux = [];
      if(i == vinhos.length-1 || vinhos[i].regiao != vinhos[i+1].regiao){
        aux.add("${vinhos[i].regiao} (TOTAL)");
        for(int j=0; j<7;j++)
          aux.add("");
        var auxList = vinhos.where((element) => element.regiao == vinhos[i].regiao).toList();
        var quantidade = 0;
        for(int j=0; j<auxList.length;j++)
         quantidade += auxList[j].quantidade;
        aux.add("$quantidade");
        _data.add(aux);
        aux = [];
      }
    }
  }
  PdfGenerator(this.vinhos){
    _sortData().then(
      (_) =>_formatData().then(
        (_) => { ready = true }
      )
    );
    _loadDirectory();
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
  pw.Widget _flag (String pais){
    return pw.Container(
      height: 72,
      child:
          pw.SvgImage(svg: image),
    );
  }
  pw.Widget _header(pw.Context context){
    return 
    pw.Padding(
      padding: pw.EdgeInsets.fromLTRB(0,5,0,15),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          _flag("s"),
          pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
            children: [
              pw.Text(
                "Wine house",
                style: pw.TextStyle(
                  fontSize: 30,
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                "França",
                style: pw.TextStyle(
                  fontSize: 18,
                ),
              ),
            ]
          ),
          _flag("s"),
        ],
      ),
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
      "Etiqueta",
      "Estoque",
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
        7 : FixedColumnWidth(240),
        8 : FixedColumnWidth(100),
      },
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.center,
        2: pw.Alignment.center,
        3: pw.Alignment.center,
        4: pw.Alignment.center,
        5: pw.Alignment.center,
        6: pw.Alignment.center,
        7: pw.Alignment.centerLeft,
        8: pw.Alignment.center,
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
      data: _data,
    );
  }

  Future<void> savePDF() async {
    while(!ready){}
    _pdf = pw.Document();
    final pageTheme = await _theme();
    _pdf.addPage(
      pw.MultiPage(
        header: _header,
        pageTheme: pageTheme,
        build: (pw.Context context) => [
          _contentTable(context),
          // pw.NewPage(),
          // pw.Text("teste"),
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