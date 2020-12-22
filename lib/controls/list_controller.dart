import '../models/vinho.dart';
  class ListController{
    List<Vinho> _vinhos = [
      Vinho(
          nome: "Taylor’s Fine Tawny",
          idade: 20,
          pais: "Portugal",
          tipo: "Porto",
      ),
    ];

    List<Vinho> get vinhos{
      return this._vinhos;
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