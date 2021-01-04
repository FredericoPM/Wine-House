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
  void Function(int id) onDelete;
  Vinho Function(Vinho vinho) onEddit;
  InfoModal({this.vinho, this.onDelete, this.onFavorite, this.onEddit}){
    imageExist = paisesController.imageExist(vinho);
  }
  @override
  _InfoModalState createState() => _InfoModalState(vinho);
}

class _InfoModalState extends State<InfoModal> {
  Vinho vinho;
  _InfoModalState(this.vinho);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375 + (widget.imageExist ? MediaQuery.of(context).size.width/2 : 30.0),
      child: Column(
        children: [
          widget.imageExist ? Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    widget.paisesController.backgroundPath(vinho),
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
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
                                    icon: Icon(vinho.favorito ? Icons.favorite : Icons.favorite_outline, color: Theme.of(context).errorColor, size: 30,),
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
                                    vinho: vinho,
                                    onEddit: (Vinho v) =>setState(() {
                                      setState(() {
                                        vinho = widget.onEddit(v);
                                      });
                                    }),
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
                                  widget.onDelete(vinho.id);
                                }
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
          ): Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(vinho.favorito ? Icons.favorite : Icons.favorite_outline, color: Theme.of(context).errorColor, size: 30,),
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
                      vinho: vinho,
                      onEddit: (Vinho v) {
                        setState(() {
                          vinho = widget.onEddit(v);
                        });
                      },
                    ))
                    ),
                  ),
                ],
              ),
              IconButton(
                  icon: Icon(Icons.delete, color: Theme.of(context).primaryColor, size: 30,),
                  onPressed: (){
                    widget.onDelete(vinho.id);
                  }
              ),
            ],
          ),
          const Divider(thickness: 1, height: 1,),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            title: AutoSizeText(
              vinho.nome,
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
                            widget.paisesController.imagePath(vinho),
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width:widget.imageExist ? 10 : 0, height: 1,),
                    Text(
                      vinho.pais,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )
            ): Text(
              vinho.pais,
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
                            initialRating: vinho.nota,
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
                              vinho.nota = rating;
                              widget.onEddit(vinho);
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
                            vinho.tipo,
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
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                              "Ano",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[600]
                              ),
                            ),
                            AutoSizeText(
                              vinho.ano.toString(),
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
                              vinho.localizacao,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              )
          ),
          const Divider(thickness: 1, height: 1,),
          Padding(
              padding: EdgeInsets.fromLTRB(15,15, 15, 5),
              child: Container(
                height: 135,
                child: ListView(
                  children: [
                    Text(
                      "Comentario",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      vinho.comentario == "" ? "Parece que este vinho não tem um comentario! Clice no botão de editar acima para colocar um." : vinho.comentario,
                      style: TextStyle(
                          fontSize: 16,
                          color: vinho.comentario == "" ? Colors.grey : Colors.grey[700]
                      ),
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}