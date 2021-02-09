import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart';
class PdfGenerator{
  var _pdf;
  Directory _directory;
  String _path;

  Future<void> loadDirectory() async {
    _directory = await getApplicationDocumentsDirectory();
    _path = '${_directory.path}/example.pdf';
  }

  PdfGenerator(){
     loadDirectory();
  }
  get path{
    return _path;
  }
  Future<pw.PageTheme> _theme() async {
    final botomImage = await rootBundle.loadString('assets/images/botton_image.svg');
    return pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      // theme: pw.ThemeData.withFont(
      //   base: pw.Font.ttf(await rootBundle.load('assets/open-sans.ttf')),
      //   bold: pw.Font.ttf(await rootBundle.load('assets/open-sans-bold.ttf')),
      //   icons: pw.Font.ttf(await rootBundle.load('assets/material.ttf')),
      // ),
      buildBackground: (pw.Context context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Stack(
            children: [
              pw.Positioned(
                child: pw.SvgImage(svg:botomImage),
                right: 0,
                bottom: 0,
              ),
            ],
          ),
        );
      },
    );
  }
  Future<void> savePDF() async {
    _pdf = pw.Document();
    final pageTheme = await _theme();
    _pdf.addPage(
      pw.MultiPage(
        pageTheme: pageTheme,
        build: (pw.Context context) => [
          pw.Center(child: pw.Text('Hellow world!'),
        ),]
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