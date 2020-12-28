import '../models/vinho.dart';
class PaisesController{
  List<Map> paisesDisponiveis = [
    {
      'pais' : 'França',
      'imagem' : 'assets/images/franca.png',
    },
    {
      'pais' : 'Itália',
      'imagem' : 'assets/images/italia.png',
    },
    {
      'pais' : 'Portugal',
      'imagem' : 'assets/images/portugal.png',
    },
  ];

  bool imageExist(Vinho vinho){
    bool result = false;
    for(int i =0; i< paisesDisponiveis.length && !result; i++){
      if(vinho.pais == paisesDisponiveis[i]['pais']){
        result = true;
      }
    }
    return result;
  }

  String imagePath(Vinho vinho){
    bool result = false;
    int index = -1;
    for(int i =0; i< paisesDisponiveis.length && !result; i++){
      if(vinho.pais == paisesDisponiveis[i]['pais']){
        result = true;
        index = i;
      }
    }
    return paisesDisponiveis[index]['imagem'];
  }
}
