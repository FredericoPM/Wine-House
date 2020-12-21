import '../models/vinho.dart';
  class ListController{
    List<Vinho> _vinhos = [
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

    List<Vinho> get vinhos{
      return this._vinhos;
    }

    void add(Vinho v){
      vinhos.add(v);
    }

    void eddit(int index, Vinho v){

    }

    void remove(int index){

    }

    List<Vinho> search(string ){

    }
}