import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../models/vinho.dart';
import '../controllers/paises.dart';
import 'wineForm.dart';
import './widgets/trasparentIconButton.dart';
import 'widgets/infoField.dart';
import 'widgets/infoRow.dart';
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
    const divider = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: const Divider(thickness: 1, height: 1,),
    );
    return Container(
      height: 350 + (widget.imageExist ? MediaQuery.of(context).size.width/2 : 30.0),
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
                            TrasparentIconButton(
                              icon: vinho.favorito ? Icons.favorite : Icons.favorite_outline,
                              color: Theme.of(context).errorColor,
                              onPressed: (){
                                setState(() {
                                  widget.onFavorite();
                                });
                              },
                            ),
                            TrasparentIconButton(
                              icon: Icons.edit,
                              color: Theme.of(context).accentColor,
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
                        ),
                        TrasparentIconButton(
                          icon: Icons.delete,
                          onPressed: (){
                            widget.onDelete(vinho.id);
                          },
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
          divider,
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
            subtitle: Text(
              "${vinho.pais} | ${vinho.regiao}",
              style: TextStyle(fontSize: 18),
            ),
          ),
          divider,
          InfoRow(
            informations: [
              InfoField(
                label:"Tipo",
                info: vinho.tipo,
              ),
              InfoField(
                label:"Safra",
                info: vinho.safra.toString(),
              ),
            ],
          ),
          divider,
          InfoRow(
            informations: [
              InfoField(
                label:"Nota R.P.",
                info: vinho.notaRP == -1 ? "Não informado" : "${vinho.notaRP}",
              ),
              InfoField(
                label:"Nota W.S.",
                info: vinho.notaWS == -1 ? "Não informado" : "${vinho.notaWS}",
              ),
            ],
          ),
          divider,
          InfoRow(
            informations: [
              InfoField(
                label:"Beber R.P.",
                info: vinho.beberRP,
              ),
              InfoField(
                label:"Quantidade",
                info: vinho.quantidade.toString(),
              ),
            ],
          ),
          divider,
          InfoRow(
            informations: [
              InfoField(
                label:"Etiqueta(s)",
                info: vinho.etiqueta,
              ),
            ],
          ),
        ],
      ),
    );
  }
}