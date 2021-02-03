import '../models/vinho.dart';
class PaisesController{
  List<Map> paisesDisponiveis = [
    {
      'pais' : 'Albânia',
      'bandeira' : 'assets/images/bandeiras/albania.png',
      'backGround' : 'assets/images/backGrounds/albania.png',
    },
    {
      'pais' : 'Alemanha',
      'bandeira' : 'assets/images/bandeiras/alemanha.png',
      'backGround' : 'assets/images/backGrounds/alemanha.png',
    },
    {
      'pais' : 'Argentina',
      'bandeira' : 'assets/images/bandeiras/argentina.png',
      'backGround' : 'assets/images/backGrounds/argentina.png',
    },
    {
      'pais' : 'Áustria',
      'bandeira' : 'assets/images/bandeiras/austria.png',
      'backGround' : 'assets/images/backGrounds/austria.png',
    },
    {
      'pais' : 'Azerbaijão',
      'bandeira' : 'assets/images/bandeiras/azerbaijao.png',
      'backGround' : 'assets/images/backGrounds/azerbaijao.png',
    },
    {
      'pais' : 'Bélgica',
      'bandeira' : 'assets/images/bandeiras/belgica.png',
      'backGround' : 'assets/images/backGrounds/belgica.png',
    },
    {
      'pais' : 'Bielorrússia',
      'bandeira' : 'assets/images/bandeiras/bielorussia.png',
      'backGround' : 'assets/images/backGrounds/bielorussia.png',
    },
    {
      'pais' : 'Bolívia',
      'bandeira' : 'assets/images/bandeiras/bolivia.png',
      'backGround' : 'assets/images/backGrounds/bolivia.png',
    },
    {
      'pais' : 'Brasil',
      'bandeira' : 'assets/images/bandeiras/brasil.png',
      'backGround' : 'assets/images/backGrounds/brasil.png',
    },
    {
      'pais' : 'Bulgária',
      'bandeira' : 'assets/images/bandeiras/bulgaria.png',
      'backGround' : 'assets/images/backGrounds/bulgaria.png',
    },
    {
      'pais' : 'Canadá',
      'bandeira' : 'assets/images/bandeiras/canada.png',
      'backGround' : 'assets/images/backGrounds/canada.png',
    },
    {
      'pais' : 'Cazaquistão',
      'bandeira' : 'assets/images/bandeiras/cazaquistao.png',
      'backGround' : 'assets/images/backGrounds/cazaquistao.png',
    },
    {
      'pais' : 'Chile',
      'bandeira' : 'assets/images/bandeiras/chile.png',
      'backGround' : 'assets/images/backGrounds/chile.png',
    },
    {
      'pais' : 'China',
      'bandeira' : 'assets/images/bandeiras/china.png',
      'backGround' : 'assets/images/backGrounds/china.png',
    },
    {
      'pais' : 'Colômbia',
      'bandeira' : 'assets/images/bandeiras/colombia.png',
      'backGround' : 'assets/images/backGrounds/colombia.png',
    },
    {
      'pais' : 'Costa Rica',
      'bandeira' : 'assets/images/bandeiras/costaRica.png',
      'backGround' : 'assets/images/backGrounds/costaRica.png',
    },
    {
      'pais' : 'Croácia',
      'bandeira' : 'assets/images/bandeiras/croacia.png',
      'backGround' : 'assets/images/backGrounds/croacia.png',
    },
    {
      'pais' : 'Cuba',
      'bandeira' : 'assets/images/bandeiras/cuba.png',
      'backGround' : 'assets/images/backGrounds/cuba.png',
    },
    {
      'pais' : 'Dinamarca',
      'bandeira' : 'assets/images/bandeiras/dinamarca.png',
      'backGround' : 'assets/images/backGrounds/dinamarca.png',
    },
    {
      'pais' : 'Equador',
      'bandeira' : 'assets/images/bandeiras/equador.png',
      'backGround' : 'assets/images/backGrounds/equador.png',
    },
    {
      'pais' : 'Dinamarca',
      'bandeira' : 'assets/images/bandeiras/dinamarca.png',
      'backGround' : 'assets/images/backGrounds/dinamarca.png',
    },
    {
      'pais' : 'Equador',
      'bandeira' : 'assets/images/bandeiras/equador.png',
      'backGround' : 'assets/images/backGrounds/equador.png',
    },
    {
      'pais' : 'Eslováquia',
      'bandeira' : 'assets/images/bandeiras/eslovaquia.png',
      'backGround' : 'assets/images/backGrounds/eslovaquia.png',
    },
    {
      'pais' : 'Espanha',
      'bandeira' : 'assets/images/bandeiras/espanha.png',
      'backGround' : 'assets/images/backGrounds/espanha.png',
    },
    {
      'pais' : 'Estados Unidos',
      'bandeira' : 'assets/images/bandeiras/estadosUnidos.png',
      'backGround' : 'assets/images/backGrounds/estadosUnidos.png',
    },
    {
      'pais' : 'Finlândias',
      'bandeira' : 'assets/images/bandeiras/finlandia.png',
      'backGround' : 'assets/images/backGrounds/finlandia.png',
    },
    {
      'pais' : 'França',
      'bandeira' : 'assets/images/bandeiras/franca.png',
      'backGround' : 'assets/images/backGrounds/franca.png',
    },
    {
      'pais' : 'Grécia',
      'bandeira' : 'assets/images/bandeiras/grecia.png',
      'backGround' : 'assets/images/backGrounds/grecia.png',
    },
    {
      'pais' : 'Guatemala',
      'bandeira' : 'assets/images/bandeiras/guatemala.png',
      'backGround' : 'assets/images/backGrounds/guatemala.png',
    },
    {
      'pais' : 'Guiana',
      'bandeira' : 'assets/images/bandeiras/guiana.png',
      'backGround' : 'assets/images/backGrounds/guiana.png',
    },
    {
      'pais' : 'Haiti',
      'bandeira' : 'assets/images/bandeiras/haiti.png',
      'backGround' : 'assets/images/backGrounds/haiti.png',
    },
    {
      'pais' : 'Holanda',
      'bandeira' : 'assets/images/bandeiras/holanda.png',
      'backGround' : 'assets/images/backGrounds/holanda.png',
    },
    {
      'pais' : 'Irlanda',
      'bandeira' : 'assets/images/bandeiras/irlanda.png',
      'backGround' : 'assets/images/backGrounds/irlanda.png',
    },
    {
      'pais' : 'Islândia',
      'bandeira' : 'assets/images/bandeiras/islandia.png',
      'backGround' : 'assets/images/backGrounds/islandia.png',
    },
    {
      'pais' : 'Itália',
      'bandeira' : 'assets/images/bandeiras/italia.png',
      'backGround' : 'assets/images/backGrounds/italia.png',
    },
    {
      'pais' : 'Jamaica',
      'bandeira' : 'assets/images/bandeiras/jamaica.png',
      'backGround' : 'assets/images/backGrounds/jamaica.png',
    },
    {
      'pais' : 'Japão',
      'bandeira' : 'assets/images/bandeiras/japao.png',
      'backGround' : 'assets/images/backGrounds/japao.png',
    },
    {
      'pais' : 'Lituânia',
      'bandeira' : 'assets/images/bandeiras/lituania.png',
      'backGround' : 'assets/images/backGrounds/lituania.png',
    },
    {
      'pais' : 'México',
      'bandeira' : 'assets/images/bandeiras/mexico.png',
      'backGround' : 'assets/images/backGrounds/mexico.png',
    },
    {
      'pais' : 'Noruega',
      'bandeira' : 'assets/images/bandeiras/noruega.png',
      'backGround' : 'assets/images/backGrounds/noruega.png',
    },
    {
      'pais' : 'Panamá',
      'bandeira' : 'assets/images/bandeiras/panama.png',
      'backGround' : 'assets/images/backGrounds/panama.png',
    },
    {
      'pais' : 'Paraguai',
      'bandeira' : 'assets/images/bandeiras/paraguai.png',
      'backGround' : 'assets/images/backGrounds/paraguai.png',
    },
    {
      'pais' : 'Peru',
      'bandeira' : 'assets/images/bandeiras/peru.png',
      'backGround' : 'assets/images/backGrounds/peru.png',
    },
    {
      'pais' : 'Polônia',
      'bandeira' : 'assets/images/bandeiras/polonia.png',
      'backGround' : 'assets/images/backGrounds/polonia.png',
    },
    {
      'pais' : 'Portugal',
      'bandeira' : 'assets/images/bandeiras/portugal.png',
      'backGround' : 'assets/images/backGrounds/portugal.png',
    },
    {
      'pais' : 'Reino Unido',
      'bandeira' : 'assets/images/bandeiras/reinoUnido.png',
      'backGround' : 'assets/images/backGrounds/reinoUnido.png',
    },
    {
      'pais' : 'República Dominicana',
      'bandeira' : 'assets/images/bandeiras/republicaDominicana.png',
      'backGround' : 'assets/images/backGrounds/republicaDominicana.png',
    },
    {
      'pais' : 'Romênia',
      'bandeira' : 'assets/images/bandeiras/romenia.png',
      'backGround' : 'assets/images/backGrounds/romenia.png',
    },
    {
      'pais' : 'Rússia',
      'bandeira' : 'assets/images/bandeiras/russia.png',
      'backGround' : 'assets/images/backGrounds/russia.png',
    },
    {
      'pais' : 'Rússia',
      'bandeira' : 'assets/images/bandeiras/suecia.png',
      'backGround' : 'assets/images/backGrounds/suecia.png',
    },
    {
      'pais' : 'Suécia',
      'bandeira' : 'assets/images/bandeiras/suecia.png',
      'backGround' : 'assets/images/backGrounds/suecia.png',
    },
    {
      'pais' : 'Suíça',
      'bandeira' : 'assets/images/bandeiras/suica.png',
      'backGround' : 'assets/images/backGrounds/suica.png',
    },
    {
      'pais' : 'Turquia',
      'bandeira' : 'assets/images/bandeiras/turquia.png',
      'backGround' : 'assets/images/backGrounds/turquia.png',
    },
    {
      'pais' : 'Ucrânia',
      'bandeira' : 'assets/images/bandeiras/ucrania.png',
      'backGround' : 'assets/images/backGrounds/ucrania.png',
    },
    {
      'pais' : 'Uruguai',
      'bandeira' : 'assets/images/bandeiras/uruguai.png',
      'backGround' : 'assets/images/backGrounds/uruguai.png',
    },
    {
      'pais' : 'Venezuela',
      'bandeira' : 'assets/images/bandeiras/venezuela.png',
      'backGround' : 'assets/images/backGrounds/venezuela.png',
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
