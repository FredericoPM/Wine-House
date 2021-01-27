import 'package:crud_app/widgets/deletePopUp.dart';
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
import 'infoModal.dart';
import "../widgets/deletePopUp.dart";
import 'package:flutter_svg/flutter_svg.dart';
class Main_list extends StatefulWidget {
  @override
  _Main_listState createState() => _Main_listState();
}

class _Main_listState extends State<Main_list> {
  PesquisaAproximada pesquisa = new PesquisaAproximada();
  TextEditingController _searchController = TextEditingController();
  ListController controller = ListController();
  List<Vinho> vinhos = [];
  List<int> selecionados = [];
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
    v.favorito = !v.favorito;
    controller.update(v).then((value) => setState(() {vinhos = controller.vinhos;}));
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
          onDelete: (int id) {
            showDialog(
                context: context,
                builder: (BuildContext context){
                  return DeletePopUp(
                    onDelete: () {
                      controller.remove(id).then((_) => setState(() {vinhos = controller.vinhos;}));
                      Navigator.of(context).pop();
                      showFlushbar(context, "Vinho deletado com sucesso!", Theme.of(context).errorColor);
                    },
                  );
                }
            );
          },
          onEddit: (Vinho v){
            controller.update(v).then((_) => controller.sort().then((_) => setState(() {vinhos = controller.vinhos;})));
            return v;
          },
        );
      },
    );
  }
  Future<void> loadData() async{
    await controller.getAll();
    setState(() {vinhos = controller.vinhos;});
  }
  @override
  void initState() {
    super.initState();
    loadData();
  }
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    final availableSpace = MediaQuery.of(context).size.height - 155 - MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(155.0),
        child: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 45, 15, 15),
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
                  selecionados.length == 0
                  ? Container(
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
                            if(value == "fv"){
                              controller.invertFavoritePriority();
                            }else{
                              controller.order = value;
                            }
                            controller.sort();
                            setState(() {vinhos = controller.vinhos;});
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
                                      controller.add(v).then((value) => setState(() {vinhos = controller.vinhos;}));
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
                  :Container(
                    width: 96,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.cancel_outlined, color: Theme.of(context).primaryColor,),
                          onPressed: (){setState(() {selecionados.clear();});}
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Theme.of(context).primaryColor,),
                          onPressed:(){
                            showDialog(
                              context: context,
                              builder: (BuildContext context){
                               return DeletePopUp(
                                 onDelete: () {
                                   setState(() {
                                     selecionados.forEach((id) {
                                       controller.remove(id).then((_) => setState(() {vinhos = controller.vinhos;}));
                                     });
                                     selecionados.clear();
                                     showFlushbar(context, "Vinho(s) deletado(s) com sucesso!", Theme.of(context).errorColor);
                                   });
                                 },
                               );
                              }
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
                          Container(
                            height: availableSpace * 0.4,
                            child: SvgPicture.asset(
                              "assets/images/wine_background.svg",
                            ),
                          ),
                          SizedBox(height: availableSpace * 0.08),
                          Text(
                            _searchController.text == "" ? "Sua adega esta vazia" : "Nenhum vinho correspondente",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
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
                          selected: selecionados.indexOf(vinhos[index].id) != -1,
                          onFavorite: () => onFavorite(vinhos[index]),
                          onTap: (BuildContext context, bool selected) {
                            if(selected)
                              setState(() {selecionados.remove(vinhos[index].id);});
                            else if(selecionados.length != 0)
                              setState(() {selecionados.add(vinhos[index].id);});
                            else
                            _showModalBottomSheet(context, vinhos[index]);
                          },
                          onLongPress: (bool selected){
                            setState(() {
                              if(selected)
                                selecionados.remove(vinhos[index].id);
                              else
                                selecionados.add(vinhos[index].id);
                            });
                          },
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
