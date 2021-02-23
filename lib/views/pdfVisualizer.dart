import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import './widgets/wineLoading.dart';
class PdfVisualizer extends StatefulWidget {
  String path;
  PdfVisualizer({Key key, this.path}) : super(key: key);

  @override
  _PdfVisualizerState createState() => _PdfVisualizerState();
}

class _PdfVisualizerState extends State<PdfVisualizer> {
  PDFViewController _controller;
  bool pdfLoaded = false;
  int _total = 0;
  int _atual = 1;

  @override

  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.keyboard_backspace,
          color: Theme.of(context).primaryColor,
          size: 30,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        "Carta de vinhos",
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.share,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
          onPressed: (){
            final RenderBox box = context.findRenderObject();
            Share.shareFiles([widget.path], text:"Veja minha Carta de vinhos:", sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
          },
        ),
      ],
    );
    final availableSpace = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - appBar.preferredSize.height;
    return Scaffold(
      appBar : appBar,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PDFView(
              filePath: widget.path,
              autoSpacing: true,
              enableSwipe: true,
              pageSnap: true,
              swipeHorizontal: true,
              onError: (e) => print(e),
              onRender: (total){
                setState(() {
                  pdfLoaded = true;
                  _total = total;
                });
              },
              onViewCreated: (controller) => _controller = controller,
              onPageChanged: (atual, total){
                setState(() {
                  _atual = atual+1;
                });
              },
            ),
            !pdfLoaded 
            ? Container(
              height: availableSpace,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFfafafa),
              child: WineLoading(
                text: "Carregando sua carta de vinhos",
              )
            )
            : Container(
              height: availableSpace *.06,
              width: MediaQuery.of(context).size.width * (.24 + _total.toString().length/50),
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Color(0x9F000000),
                borderRadius: BorderRadius.all(Radius.circular(availableSpace *.03)),
              ),
              child: Text(
                "${_atual.toString().padLeft(_total.toString().length - _atual.toString().length + 1, '0')} de $_total",
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 18
                ),
              )
            ),
          ],
        )
    );
  }
}