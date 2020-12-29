import '../models/vinho.dart';
class PaisesController{
  List<Map> paisesDisponiveis = [
    {
      'pais' : 'França',
      'bandeira' : 'assets/images/franca.png',
      'backGround' : 'assets/images/franca_background.png',
    },
    {
      'pais' : 'Itália',
      'bandeira' : 'assets/images/italia.png',
      'backGround' : 'assets/images/italia_background.png',
    },
    {
      'pais' : 'Portugal',
      'bandeira' : 'assets/images/portugal.png',
      'backGround' : 'assets/images/portugal_background.png',
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
    return paisesDisponiveis[index]['bandeira'];
  }
  String backgroundPath(Vinho vinho){
    bool result = false;
    int index = -1;
    for(int i =0; i< paisesDisponiveis.length && !result; i++){
      if(vinho.pais == paisesDisponiveis[i]['pais']){
        result = true;
        index = i;
      }
    }
    return paisesDisponiveis[index]['backGround'];
  }
}
