import 'package:flutter/material.dart';
import '../models/vinho.dart';
import '../widgets/listCard_widget.dart';
import 'wineForm_view.dart';
import '../widgets/textField.dart';
class Main_list extends StatefulWidget {
  @override
  _Main_listState createState() => _Main_listState();
}

class _Main_listState extends State<Main_list> {
  TextEditingController _searchController = TextEditingController();
  List<Vinho> vinhos = [
    Vinho(
      nome: "Taylor’s Fine Tawny",
      ano: 1970,
      pais: "Portugal",
      regiao: "douro",
      produtor: "Taylor's",
      uvas: [
        "Tempranillo (Tinta Roriz / Aragonez)",
        "Tinta Barroca",
        "Tinto Cão",
        "Touriga Franca"
      ],
      tipo: "Porto",
      teorAlcolico: 20,
      volume: 750
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(162.0),
        child: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Adega Virtual",
                    style: TextStyle(
                      color: Color(0xFF942641),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  TextFild(
                    controller: _searchController,
                    hintText: "Pesquise um vinho",
                    onChanged: (String text) {print(text);},
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
                      IconButton(
                          icon: Icon(
                            Icons.sort_rounded,
                            size: 27,
                            color: Color(0xFF942641),
                          ),
                          onPressed: (){
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (context) {
                                return WineForm();
                              },
                            );
                          }
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.add_circle_outline,
                            size: 27,
                            color: Color(0xFF942641),
                          ),
                          onPressed: (){}
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
              height: 200,
              child: ListView.builder(
                  itemCount: vinhos.length,
                  itemBuilder: (ctx, index) {
                    return ListCard(
                        vinho: vinhos[index],
                        onFavorite: () => setState(() {vinhos[index].favorito = !vinhos[index].favorito; }),
                    );
                  }
              ),
            )
          ],
        ),
      )
    );
  }
}
