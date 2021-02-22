import '../models/vinho.dart';
import '../controllers/pesquisaAproximada.dart';
class PaisesController{
  List<Map> _paisesDisponiveis = [
    {
      'pais' : 'Albânia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/albania.png',
      'backGround' : 'assets/images/backGrounds/albania.png',
    },
    {
      'pais' : 'Alemanha',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/alemanha.png',
      'backGround' : 'assets/images/backGrounds/alemanha.png',
    },
    {
      'pais' : 'Argentina',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/argentina.png',
      'backGround' : 'assets/images/backGrounds/argentina.png',
    },
    {
      'pais' : 'Áustria',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/austria.png',
      'backGround' : 'assets/images/backGrounds/austria.png',
    },
    {
      'pais' : 'Azerbaijão',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/azerbaijao.png',
      'backGround' : 'assets/images/backGrounds/azerbaijao.png',
    },
    {
      'pais' : 'Bélgica',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/belgica.png',
      'backGround' : 'assets/images/backGrounds/belgica.png',
    },
    {
      'pais' : 'Bielorrússia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/bielorussia.png',
      'backGround' : 'assets/images/backGrounds/bielorussia.png',
    },
    {
      'pais' : 'Bolívia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/bolivia.png',
      'backGround' : 'assets/images/backGrounds/bolivia.png',
    },
    {
      'pais' : 'Brasil',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/brasil.png',
      'backGround' : 'assets/images/backGrounds/brasil.png',
    },
    {
      'pais' : 'Bulgária',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/bulgaria.png',
      'backGround' : 'assets/images/backGrounds/bulgaria.png',
    },
    {
      'pais' : 'Canadá',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/canada.png',
      'backGround' : 'assets/images/backGrounds/canada.png',
    },
    {
      'pais' : 'Cazaquistão',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/cazaquistao.png',
      'backGround' : 'assets/images/backGrounds/cazaquistao.png',
    },
    {
      'pais' : 'Chile',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/chile.png',
      'backGround' : 'assets/images/backGrounds/chile.png',
    },
    {
      'pais' : 'China',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/china.png',
      'backGround' : 'assets/images/backGrounds/china.png',
    },
    {
      'pais' : 'Colômbia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/colombia.png',
      'backGround' : 'assets/images/backGrounds/colombia.png',
    },
    {
      'pais' : 'Costa Rica',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/costaRica.png',
      'backGround' : 'assets/images/backGrounds/costaRica.png',
    },
    {
      'pais' : 'Croácia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/croacia.png',
      'backGround' : 'assets/images/backGrounds/croacia.png',
    },
    {
      'pais' : 'Cuba',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/cuba.png',
      'backGround' : 'assets/images/backGrounds/cuba.png',
    },
    {
      'pais' : 'Dinamarca',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/dinamarca.png',
      'backGround' : 'assets/images/backGrounds/dinamarca.png',
    },
    {
      'pais' : 'Equador',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/equador.png',
      'backGround' : 'assets/images/backGrounds/equador.png',
    },
    {
      'pais' : 'Dinamarca',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/dinamarca.png',
      'backGround' : 'assets/images/backGrounds/dinamarca.png',
    },
    {
      'pais' : 'Equador',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/equador.png',
      'backGround' : 'assets/images/backGrounds/equador.png',
    },
    {
      'pais' : 'Eslováquia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/eslovaquia.png',
      'backGround' : 'assets/images/backGrounds/eslovaquia.png',
    },
    {
      'pais' : 'Espanha',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/espanha.png',
      'backGround' : 'assets/images/backGrounds/espanha.png',
    },
    {
      'pais' : 'Estados Unidos',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/estadosUnidos.png',
      'backGround' : 'assets/images/backGrounds/estadosUnidos.png',
    },
    {
      'pais' : 'Finlândias',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/finlandia.png',
      'backGround' : 'assets/images/backGrounds/finlandia.png',
    },
    {
      'pais' : 'França',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/franca.png',
      'backGround' : 'assets/images/backGrounds/franca.png',
    },
    {
      'pais' : 'Grécia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/grecia.png',
      'backGround' : 'assets/images/backGrounds/grecia.png',
    },
    {
      'pais' : 'Guatemala',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/guatemala.png',
      'backGround' : 'assets/images/backGrounds/guatemala.png',
    },
    {
      'pais' : 'Guiana',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/guiana.png',
      'backGround' : 'assets/images/backGrounds/guiana.png',
    },
    {
      'pais' : 'Haiti',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/haiti.png',
      'backGround' : 'assets/images/backGrounds/haiti.png',
    },
    {
      'pais' : 'Holanda',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/holanda.png',
      'backGround' : 'assets/images/backGrounds/holanda.png',
    },
    {
      'pais' : 'Irlanda',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/irlanda.png',
      'backGround' : 'assets/images/backGrounds/irlanda.png',
    },
    {
      'pais' : 'Islândia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/islandia.png',
      'backGround' : 'assets/images/backGrounds/islandia.png',
    },
    {
      'pais' : 'Itália',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/italia.png',
      'backGround' : 'assets/images/backGrounds/italia.png',
    },
    {
      'pais' : 'Jamaica',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/jamaica.png',
      'backGround' : 'assets/images/backGrounds/jamaica.png',
    },
    {
      'pais' : 'Japão',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/japao.png',
      'backGround' : 'assets/images/backGrounds/japao.png',
    },
    {
      'pais' : 'Lituânia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/lituania.png',
      'backGround' : 'assets/images/backGrounds/lituania.png',
    },
    {
      'pais' : 'México',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/mexico.png',
      'backGround' : 'assets/images/backGrounds/mexico.png',
    },
    {
      'pais' : 'Noruega',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/noruega.png',
      'backGround' : 'assets/images/backGrounds/noruega.png',
    },
    {
      'pais' : 'Panamá',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/panama.png',
      'backGround' : 'assets/images/backGrounds/panama.png',
    },
    {
      'pais' : 'Paraguai',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/paraguai.png',
      'backGround' : 'assets/images/backGrounds/paraguai.png',
    },
    {
      'pais' : 'Peru',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/peru.png',
      'backGround' : 'assets/images/backGrounds/peru.png',
    },
    {
      'pais' : 'Polônia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/polonia.png',
      'backGround' : 'assets/images/backGrounds/polonia.png',
    },
    {
      'pais' : 'Portugal',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/portugal.png',
      'backGround' : 'assets/images/backGrounds/portugal.png',
    },
    {
      'pais' : 'Reino Unido',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/reinoUnido.png',
      'backGround' : 'assets/images/backGrounds/reinoUnido.png',
    },
    {
      'pais' : 'República Dominicana',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/republicaDominicana.png',
      'backGround' : 'assets/images/backGrounds/republicaDominicana.png',
    },
    {
      'pais' : 'Romênia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/romenia.png',
      'backGround' : 'assets/images/backGrounds/romenia.png',
    },
    {
      'pais' : 'Rússia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/russia.png',
      'backGround' : 'assets/images/backGrounds/russia.png',
    },
    {
      'pais' : 'Rússia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/suecia.png',
      'backGround' : 'assets/images/backGrounds/suecia.png',
    },
    {
      'pais' : 'Suécia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/suecia.png',
      'backGround' : 'assets/images/backGrounds/suecia.png',
    },
    {
      'pais' : 'Suíça',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/suica.png',
      'backGround' : 'assets/images/backGrounds/suica.png',
    },
    {
      'pais' : 'Turquia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/turquia.png',
      'backGround' : 'assets/images/backGrounds/turquia.png',
    },
    {
      'pais' : 'Ucrânia',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/ucrania.png',
      'backGround' : 'assets/images/backGrounds/ucrania.png',
    },
    {
      'pais' : 'Uruguai',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/uruguai.png',
      'backGround' : 'assets/images/backGrounds/uruguai.png',
    },
    {
      'pais' : 'Venezuela',
      'bandeiraIcon' : 'assets/images/bandeiras/icons/venezuela.png',
      'backGround' : 'assets/images/backGrounds/venezuela.png',
    },
  ];
  get paisesDisponiveis{
    return _paisesDisponiveis.map((e) => e['pais']).toList();
  }
  List<dynamic> getSuggestions(String pattern){
    PesquisaAproximada pesquisa = PesquisaAproximada();
    return paisesDisponiveis.where((pais) => pesquisa.pFromStart(pattern.toLowerCase(), pais.toLowerCase())).toList();
  }
  bool imageExist(Vinho vinho){
    bool result = false;
    for(int i =0; i< _paisesDisponiveis.length && !result; i++){
      if(vinho.pais == _paisesDisponiveis[i]['pais']){
        result = true;
      }
    }
    return result;
  }
  String iconPath(Vinho vinho){
    bool result = false;
    int index = -1;
    for(int i =0; i< _paisesDisponiveis.length && !result; i++){
      if(vinho.pais == _paisesDisponiveis[i]['pais']){
        result = true;
        index = i;
      }
    }
    return _paisesDisponiveis[index]['bandeiraIcon'];
  }
  String flagPath(Vinho vinho){
    bool result = false;
    int index = -1;
    for(int i =0; i< _paisesDisponiveis.length && !result; i++){
      if(vinho.pais == _paisesDisponiveis[i]['pais']){
        result = true;
        index = i;
      }
    }
    return _paisesDisponiveis[index]['bandeira'];
  }
  String backgroundPath(Vinho vinho){
    bool result = false;
    int index = -1;
    for(int i =0; i< _paisesDisponiveis.length && !result; i++){
      if(vinho.pais == _paisesDisponiveis[i]['pais']){
        result = true;
        index = i;
      }
    }
    return _paisesDisponiveis[index]['backGround'];
  }
  
}
