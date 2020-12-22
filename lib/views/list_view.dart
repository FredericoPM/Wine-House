import 'package:flutter/material.dart';
import '../controls/list_controller.dart';
import '../models/vinho.dart';
import '../widgets/listCard_widget.dart';
import '../widgets/textField.dart';
import 'wineForm_view.dart';
class Main_list extends StatefulWidget {
  @override
  _Main_listState createState() => _Main_listState();
}

class _Main_listState extends State<Main_list> {
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

                          }
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.add_circle_outline,
                            size: 27,
                            color: Color(0xFF942641),
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => WineForm(onAdd: (Vinho v) => controller.add(v).then((value) => setState(() {vinhos = controller.vinhos;})),)));
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
