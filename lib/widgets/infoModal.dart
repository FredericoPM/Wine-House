import 'package:flutter/material.dart';
import '../models/vinho.dart';
import '../controls/paises.dart';
import '../views/wineForm.dart';
class InfoModal extends StatefulWidget {
  Vinho vinho;
  bool imageExist;
  PaisesController paisesController = PaisesController();
  void Function() onFavorite;
  void Function(Vinho vinho) onDelete;
  void Function(Vinho vinho) onEddit;
  InfoModal({this.vinho, this.onDelete, this.onFavorite, this.onEddit}){
    imageExist = paisesController.imageExist(vinho);
  }
  @override
  _InfoModalState createState() => _InfoModalState();
}

class _InfoModalState extends State<InfoModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170 + (widget.imageExist ? MediaQuery.of(context).size.width/2 : 0.0),
      child: Column(
        children: [
          widget.imageExist ? Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    widget.paisesController.backgroundPath(widget.vinho),
                    fit: BoxFit.cover,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                opacity: 0.7,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(widget.vinho.favorito ? Icons.favorite : Icons.favorite_outline, color: Theme.of(context).errorColor, size: 30,),
                                  onPressed: (){
                                    setState(() {
                                      widget.onFavorite();
                                    });
                                  }
                              ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                opacity: 0.7,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.edit, color: Theme.of(context).accentColor, size: 30),
                                  onPressed: () => Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => WineForm(
                                      vinho: widget.vinho,
                                      onEddit: (Vinho v) => widget.onEddit(v),
                                    ))
                                  ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Opacity(
                            opacity: 0.7,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.delete, color: Theme.of(context).primaryColor, size: 30,),
                              onPressed: (){
                                widget.onDelete(widget.vinho);
                              }
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
          ): SizedBox(height: 0,width: 0,),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            title: widget.vinho.nome.length <= 25
                ? Text(
              widget.vinho.nome,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),
            )
                : FittedBox(
              child: Text(
                widget.vinho.nome,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: widget.imageExist
                ?Container(
                height: 40,
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          radius: 15,
                        ),
                        Container(
                          height:27,
                          child: Image.asset(
                            widget.paisesController.imagePath(widget.vinho),
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width:widget.imageExist ? 10 : 0, height: 1,),
                    Text(
                      widget.vinho.pais,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )
            ): Text(
              widget.vinho.pais,
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Divider(thickness: 1),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tipo",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600]
                      ),
                    ),
                    Text(
                      widget.vinho.tipo,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Localização",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600]
                      ),
                    ),
                    Text(
                      widget.vinho.localizacao.toUpperCase(),
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}