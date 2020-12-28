class PesquisaAproximada{

  int menor( int x, int y, int z){
    return x < y ? x < z ? x : z : y < z ? y : z;
  }

  //Foi ulizado o metodo de casamento de padroes de distancia de Levenshtein
  bool pFromStart(String text, String name){
    int size = text.length + 1;
    List<List<int>> matriz = new List<List<int>>(size);
    int distancia;
    //aloca as linhas da matriz e preenche a linha e a coluna 0 com 0 a size-1
    for (int i = 0; i < size; i++) {
      List<int> list = new List<int>(size);
      for (int j = 0; j < (i == 0 ? size : 1); j++) {
        list[j] = i == 0 ? j : i;
      }
      matriz[i] = list;
    }
    for(int i = 1; i<size; i++){
      for(int j = 1; j<size; j++){
        matriz[i][j] = menor(matriz[i-1][j]+1, matriz[i][j-1]+1, matriz[i-1][j-1] + (text[i-1] == name[j-1] ? 0 : 1));
      }
    }
    distancia = matriz[size-1][size-1];
    //strings de ate 05 caracteres toleram distancia de no maximo 1
    //strings de ate 10 caracteres toleram distancia de no maximo 2
    //strings de ate 15 ou mais  caracteres toleram distancia de no maximo 3
    if(distancia == 0 || (distancia < 3 && size >= 5 && size < 10) || (distancia < 4 && size >= 10 && size < 15) || (distancia < 5 && size >= 15))
      return true;
    return false;

  }
}