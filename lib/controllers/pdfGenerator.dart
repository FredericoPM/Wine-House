import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
class PdfGenerator{
  final _pdf = pw.Document();
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
  
  Future<void> savePDF() async {

    _pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hellow world!'),
          
        ),
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