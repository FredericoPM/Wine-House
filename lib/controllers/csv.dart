import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
class Csv{

  Future<String> readData(path){
    return rootBundle.loadString(path);
  }
  Future<bool> convertData() async{
    try {
    // Read the file.
    String data = await readData("assets/vinhos.csv");
    List<List<String>> itens = data.split("\n").map((e) => e.split(",")).toList();
    bool flag = false;
    int start = 0;
    int end = 0;
    String aux= "";

    for(int i = 10; i<11; i++){
      for(int j=0; itens[i].length > 10 && j<itens[i].length; j++){
        if(start == 0 && flag)
          start = j;
        if(start != 0 && end == 0 && !flag)
          end = j;

        for(int k = start; start != end && k <= end; k++){
          aux = aux + (aux == "" ? "" : ",") + itens[i][k];
          if(k == end){
            aux = aux.substring(1,aux.length-1);
            itens[i][start] = aux;
            for(int l = 0; l < end-start; l++){
              itens[i].removeAt(start+1);
            }
            j = start;
            flag = false;
            start = 0;
            end = 0;
            aux = "";
          }
        }
      }
    }
    return true;
  } catch (e) {
    // If encountering an error, return 0.
    print("Erro: $e");
    return false;
  }
  }
}