import 'package:flutter/material.dart';
import '../controls/list.dart';
import '../models/vinho.dart';
import '../widgets/listCard.dart';
import '../widgets/textField.dart';
import 'wineForm.dart';
import '../controls/pesquisaAproximada.dart';
class Main_list extends StatefulWidget {
  @override
  _Main_listState createState() => _Main_listState();
}

class _Main_listState extends State<Main_list> {
  PesquisaAproximada pesquisa = new PesquisaAproximada();
  TextEditingController _searchController = TextEditingController();
  ListController controller = ListController();
  List<Vinho> vinhos;
  @override
  void initState() {
    vinhos = controller.vinhos;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
            Row(
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
                              leading: Icon(Icons.wine_bar_outlined, color: controller.order == "nm" ? Color(0xFF7fbb4a) : Colors.grey[700]),
                              title: Text(
                                "Nome",
                                style: TextStyle(fontWeight: controller.order == "nm" ? FontWeight.bold : null),
                              ),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: "tp",
                            child: ListTile(
                              leading: Icon(Icons.wine_bar, color: controller.order == "tp" ? Color(0xFF7fbb4a) : Colors.grey[700]),
                              title: Text(
                                "Tipo",
                                style: TextStyle(fontWeight: controller.order == "tp" ? FontWeight.bold : null),
                              ),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: "pa",
                            child: ListTile(
                              leading: Icon(Icons.place_outlined, color: controller.order == "pa" ? Color(0xFF7fbb4a) : Colors.grey[700]),
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
                              leading: Icon(Icons.favorite, color: controller.favoritePriority ? Color(0xFF7fbb4a) : Colors.grey[700]),
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
                            Icons.add_circle_outline,
                            size: 27,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => WineForm(onAdd: (Vinho v) => controller.add(v).then((value) => setState(() {vinhos = controller.vinhos;})))));
                          }
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              child: vinhos.length == 0 ? Opacity(
                opacity: 0.5,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Sua adega esta vazia",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 200,
                      child: Image.asset(
                        "assets/images/adega.png",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ) : ListView.builder(
                  itemCount: vinhos.length,
                  itemBuilder: (ctx, index) {
                    return ListCard(
                        vinho: vinhos[index],
                        onFavorite: () => setState(() {
                          vinhos[index].favorito = !vinhos[index].favorito;
                          if(controller.favoritePriority)
                            controller.sort();
                        }),
                    );
                  }
              ),
            ),
          ],
        ),
      )
    );
  }
}
