import '../models/vinho.dart';
class ListController{
  List<Vinho> _vinhos = [
//    Vinho(
//        nome: "Taylor’s Fine Tawny",
//        idade: 20,
//        pais: "Portugal",
//        tipo: "Porto",
//    ),
//    Vinho(
//      nome: "Marchesi del Salento",
//      idade: 1,
//      pais: "Itália",
//      tipo: "Tinto",
//    ),
//    Vinho(
//      nome: "Les Templiers Cabernet Sauvignon",
//      idade: 20,
//      pais: "França",
//      tipo: "Tinto Seco",
//    ),
//    Vinho(
//      nome: "Famiglia Castellani Pinot Grigio",
//      idade: 1,
//      pais: "Itália",
//      tipo: "Branco",
//    ),
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

  void sort() async{
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
  Future<void> add(Vinho v) async{
    vinhos.add(v);
  }

  void eddit(int index, Vinho v){

  }

  void remove(int index){

  }

  List<Vinho> search(string ){

  }
}