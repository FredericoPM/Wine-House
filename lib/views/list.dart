import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flushbar/flushbar.dart';
import '../controls/pesquisaAproximada.dart';
import '../controls/list.dart';
import '../models/vinho.dart';
import 'wineForm.dart';
import '../widgets/listCard.dart';
import '../widgets/textField.dart';
import '../widgets/infoModal.dart';
class Main_list extends StatefulWidget {
  @override
  _Main_listState createState() => _Main_listState();
}

class _Main_listState extends State<Main_list> {
  PesquisaAproximada pesquisa = new PesquisaAproximada();
  TextEditingController _searchController = TextEditingController();
  ListController controller = ListController();
  List<Vinho> vinhos;
  void showFlushbar(BuildContext context, String text, var color){
    Flushbar(
      messageText: Text(text, style: TextStyle(color: color, fontWeight: FontWeight.bold),),
      duration: Duration(seconds: 5),
      backgroundColor: Colors.white,
      borderColor: Colors.grey[300],
      margin: EdgeInsets.all(18),
      borderRadius: 8,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    )..show(context);
  }
  void onFavorite(Vinho v){
    int index = controller.vinhos.indexOf(v);
    setState(() {
      vinhos[index].favorito = !vinhos[index].favorito;
      if(controller.favoritePriority)
        controller.sort();
    });
  }
  void _showModalBottomSheet(BuildContext context, Vinho vinho) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15.0),
            topRight: const Radius.circular(15.0)
        ),
      ),
      context: context,
      builder: (context) {
        return InfoModal(
          vinho: vinho,
          onFavorite: () => onFavorite(vinho),
          onDelete: (Vinho vinho) {
            setState(() {
              controller.remove(vinho);
            });
            Navigator.of(context).pop();
            showFlushbar(context, "Vinho deletado com sucesso", Theme.of(context).errorColor);
          },
          onEddit: (Vinho v){
            setState(() {
              controller.eddit(v, controller.vinhos.indexOf(vinho));
              controller.sort();
            });
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    vinhos = controller.vinhos;
    super.initState();
  }
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    final availableSpace = MediaQuery.of(context).size.height - 145 - MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(145.0),
        child: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 35, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Wine House",
                    style: TextStyle(
                      fontFamily: 'GreatVibes',
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  TextFild(
                    controller: _searchController,
                    hintText: "Pesquise um vinho",
                    onChanged: (String text) {
                      setState(() {
                        if(text == "")
                          vinhos = controller.vinhos;
                        else{
                          vinhos = controller.vinhos.where((v) =>pesquisa.pFromStart(text.toUpperCase(),v.nome.toUpperCase())).toList();
                        }
                      });
                    },
                    icon: Icon(Icons.search, color: Colors.grey[700]),
                  )
                ],
              ),
            )
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: Column(
          children: [
            Container(
              height: availableSpace*0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vinhos",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                    ),
                  ),
                  Container(
                    width: 96,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PopupMenuButton<String>(
                          icon: Icon(
                            Icons.sort_rounded,
                            size: 27,
                            color: Theme.of(context).primaryColor,
                          ),
                          padding: EdgeInsets.zero,
                          onSelected: (value) {
                            setState(() {
                              if(value == "fv"){
                                controller.invertFavoritePriority();
                              }else{
                                controller.order = value;
                              }
                              controller.sort();
                            });
                          },
                          itemBuilder: (context) => <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              enabled: false,
                              child: Text(
                                "Ordenar por:",
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "nm",
                              child: ListTile(
                                leading: Icon(Icons.wine_bar_outlined, color: controller.order == "nm" ? Theme.of(context).accentColor : Colors.grey[700]),
                                title: Text(
                                  "Nome",
                                  style: TextStyle(fontWeight: controller.order == "nm" ? FontWeight.bold : null),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "tp",
                              child: ListTile(
                                leading: Icon(Icons.wine_bar, color: controller.order == "tp" ? Theme.of(context).accentColor : Colors.grey[700]),
                                title: Text(
                                  "Tipo",
                                  style: TextStyle(fontWeight: controller.order == "tp" ? FontWeight.bold : null),
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "pa",
                              child: ListTile(
                                leading: Icon(Icons.place_outlined, color: controller.order == "pa" ? Theme.of(context).accentColor : Colors.grey[700]),
                                title: Text(
                                  "Pais",
                                  style: TextStyle(fontWeight: controller.order == "pa" ? FontWeight.bold : null),
                                ),
                              ),
                            ),
                            const PopupMenuDivider(),
                            PopupMenuItem<String>(
                              value: "fv",
                              child: ListTile(
                                leading: Icon(Icons.favorite, color: controller.favoritePriority ? Theme.of(context).accentColor : Colors.grey[700]),
                                title: Text(
                                  "Favoritos",
                                  style: TextStyle(fontWeight: controller.favoritePriority ? FontWeight.bold : null),
                                ),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              size: 27,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: (){
                              Navigator.push(
                                context, MaterialPageRoute(builder: (context) => WineForm(
                                    onAdd: (Vinho v) {
                                      controller.add(v);
                                      controller.sort().then((value) => setState(() {vinhos = controller.vinhos;}));
                                      Navigator.of(context).pop();
                                      showFlushbar(context, "Novo vinho cadastrado com sucesso!", Theme.of(context).accentColor);
                                    }
                                ))
                              );
                            }
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: availableSpace * 0.9,
              child: vinhos.length == 0
                ? Opacity(
                  opacity: 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            _searchController.text == "" ? "Sua adega esta vazia" : "Nenhum vinho correspondente",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: availableSpace * 0.08),
                          Container(
                            height: availableSpace * 0.4,
                            child: Image.asset(
                              "assets/images/adega.png",
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ) : Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15 + MediaQuery.of(context).viewInsets.bottom),
                  child: ListView.builder(
                      itemCount: vinhos.length,
                      itemBuilder: (ctx, index) {
                        return ListCard(
                          vinho: vinhos[index],
                          onFavorite: () => onFavorite(vinhos[index]),
                          onTap: (BuildContext context) => _showModalBottomSheet(context, vinhos[index]) ,
                        );
                      }
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
