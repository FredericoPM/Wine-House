import 'package:flutter/material.dart';
import '../models/vinho.dart';
import '../controls/paises.dart';
import '../views/wineForm.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
  bool comentarioOn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220 + (widget.imageExist ? MediaQuery.of(context).size.width/2 : 30.0) + (comentarioOn ? 110.0 : 0.0),
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
          ): Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(widget.vinho.favorito ? Icons.favorite : Icons.favorite_outline, color: Theme.of(context).errorColor, size: 30,),
                      onPressed: (){
                        setState(() {
                          widget.onFavorite();
                        });
                      }
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
              ),
              IconButton(
                  icon: Icon(Icons.delete, color: Theme.of(context).primaryColor, size: 30,),
                  onPressed: (){
                    widget.onDelete(widget.vinho);
                  }
              ),
            ],
          ),
          const Divider(thickness: 1, height: 1,),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            title: AutoSizeText(
              widget.vinho.nome,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
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
          const Divider(thickness: 1,height: 1,),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: LayoutBuilder(
              builder: (ctx, constraints){
                return Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Avaliação",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600]
                          ),
                        ),
                        RatingBar.builder(
                          itemSize: (constraints.maxWidth*9)/100,
                          unratedColor: Colors.grey[300],
                          initialRating: 0,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 10,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                    SizedBox(width: (constraints.maxWidth*2)/20,),
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
                        AutoSizeText(
                          widget.vinho.tipo,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                );
              },
            )
          ),
          const Divider(thickness: 1, height: 1,),
          Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: LayoutBuilder(
                builder: (ctx, constraints){
                  return Row(
                    children: [
                      Container(
                          width:(constraints.maxWidth*9)/20,
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Localização",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[600]
                              ),
                            ),
                            AutoSizeText(
                              widget.vinho.localizacao,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: (constraints.maxWidth*2)/20, height: 1,),
                      Container(
                        width: (constraints.maxWidth*9)/20,
                        child: FittedBox(
                          child: FlatButton(
                            onPressed: (){
                              setState(() {
                                comentarioOn = !comentarioOn;
                              });
                            },
                            padding: EdgeInsets.all(0),
                            child: Row(
                              children: [
                                Text(
                                  "Comentario",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Icon(comentarioOn ?Icons.arrow_drop_up : Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )
          ),
          const Divider(thickness: 1, height: 1,),
          comentarioOn
          ? Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Container(
              height: 95,
              child: ListView(
                children: [
                  SizedBox(height: 2),
                  Text(
                    widget.vinho.comentario == "" ? "Parece que este vinho não tem um comentario" : widget.vinho.comentario,
                    style: TextStyle(
                        fontSize: 16,
                        color: widget.vinho.comentario == "" ? Colors.grey : Colors.black
                    ),
                  ),
                ],
              ),
            )
          )
          : SizedBox(height: 0, width: 0,),
        ],
      ),
    );
  }
}