import '../models/vinho.dart';
class ListController{
  List<Vinho> _vinhos = [
    Vinho(
        id: 0,
        nome: "Taylor’s Fine Tawny",
        ano: 2020,
        pais: "Portugal",
        tipo: "Porto",
        localizacao: "9a",
        nota: 0.0
    ),
    Vinho(
        id: 1,
        nome: "Marchesi del Salento",
        ano: 2017,
        pais: "Itália",
        tipo: "Tinto",
        localizacao: "9a",
        nota: 0.0
    ),
    Vinho(
        id: 2,
        nome: "Les Templiers Cabernet Sauvignon",
        ano: 2019,
        pais: "França",
        tipo: "Tinto Seco",
        localizacao: "9a",
        nota: 0.0
    ),
    Vinho(
        id: 3,
        nome: "Famiglia Castellani Pinoti Grigio",
        ano: 2020,
        pais: "Itália",
        tipo: "Branco",
        localizacao: "9a",
        nota: 0.0
    ),
    Vinho(
        id: 4,
        nome: "Carnivor Cabernet Sauvignon",
        ano: 2017,
        pais: "Estados Unidos",
        tipo: "Tinto Meio Seco",
        localizacao: "9a",
        nota: 0.0,
        comentario: "Elaborado com a Cabernet Sauvignon, considerada a rainha das uvas tintas, esse rótulo faz referência a ousadia e a audácia do topo da cadeia alimentar, os carnívoros. Com um estilo que agrada os mais diversos paladares, o Carnivor reúne tudo o que você procura em um vinho: personalano, potência e sabor persistente."
    ),
  ];
  String _order = "nm";
  bool _favoritePriority = false;

  List<Vinho> get vinhos{
    return this._vinhos;
  }

  set order(String newOrder){
    this._order = newOrder;
  }
  String get order{
    return this._order;
  }

  void invertFavoritePriority(){
    this._favoritePriority = !this._favoritePriority;
  }
  bool get favoritePriority{
    return this._favoritePriority;
  }

  Future<void> sort() async{
    switch(_order){
      case "nm":
        _vinhos.sort((a, b) {
          if(_favoritePriority && a.favorito ^ b.favorito){
            return a.favorito ? -1 : 1;
          }
          int nomeCompare = a.nome.compareTo(b.nome);
          return nomeCompare == 0 ? a.tipo.compareTo(b.tipo) :nomeCompare;
        });
        break;
      case "tp":
        _vinhos.sort((a, b) {
          if(_favoritePriority && a.favorito ^ b.favorito){
            return a.favorito ? -1 : 1;
          }
          int tipoCompare = a.tipo.compareTo(b.tipo);
          return tipoCompare == 0 ? a.nome.compareTo(b.nome) : tipoCompare;
        });
        break;
      case "pa":
        _vinhos.sort((a, b) {
          if(_favoritePriority && a.favorito ^ b.favorito){
            return a.favorito ? -1 : 1;
          }
          int paisCompare = a.pais.compareTo(b.pais);
          return paisCompare == 0 ? a.nome.compareTo(b.nome) : paisCompare;
        });
        break;
    }
  }
  int _lastId(){
    int lastId = 0;
    vinhos.forEach((v) {
      if(v.id > lastId)
        lastId = v.id;
    });
    return lastId;
  }

  Future<void> add(Vinho v) async{
    v.id = _lastId();
    vinhos.add(v);
  }
  void eddit(Vinho v, int index){
    vinhos[index] = v;
  }
  void remove(Vinho vinho){
    vinhos.removeWhere((v) => v.nome == vinho.nome &&  v.localizacao == vinho.localizacao);
  }
  Vinho search(int id){
    List<Vinho> resultados = vinhos.where((v) => v.id == id).toList();
    return resultados[0];
  }
  int searchIndex(int id){
    for(int i=0; i<vinhos.length;i++){
      if(vinhos[i].id == id)
        return i;
    }
    return -1;
  }
}