import '../models/vinho.dart';
import '../repositories/vinhos_SQLite.dart';
class ListController{
  List<Vinho> _vinhos = [];
  String _order = "nm";
  bool _favoritePriority = false;
  VinhosSQLite dataBase = VinhosSQLite();

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
  Future<void> getAll() async{
    if(dataBase.db == null)
      await dataBase.DBconstructor();
    _vinhos = await dataBase.getAll();
    await sort();
  }

  Future<void> add(Vinho v) async{
    if(dataBase.db == null)
      await dataBase.DBconstructor();
    await dataBase.insert(v);
    await getAll();
  }

  Future<void> update(Vinho v) async{
    if(dataBase.db == null)
      await dataBase.DBconstructor();
    await dataBase.update(v);
    await getAll();
  }

  Future<void> remove(Vinho vinho) async{
    if(dataBase.db == null)
      await dataBase.DBconstructor();
    await dataBase.delete(vinho.id);
    await getAll();
  }
  Vinho search(int id){
    List<Vinho> resultados = vinhos.where((element) => element.id == id).toList();
    return resultados[0];
  }
}