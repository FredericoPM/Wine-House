import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import '../models/vinho.dart';
class Csv{

  Future<String> readData(path){
    return rootBundle.loadString(path);
  }

  Future<bool> convertData(void Function(Vinho v) add) async{
    try {
      String data = await readData("assets/vinhos.csv");
      List<List<String>> itens = data.split("\n").map((e) => e.split(",")).toList();
      bool flag = false;
      int start = 0;
      int end = 0;
      String aux= "";

      for(int i = 1; i<itens.length; i++){
        for(int j=0; itens[i].length > 10 && j<itens[i].length; j++){
          flag = flag ^ (itens[i][j].indexOf('"') != -1);
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
        // print("===================================");
        // itens[3].forEach((element) {
        //   print("$element\n");
        // });
        addData(itens[i], add);
      }
      return true;
    } catch (e) {
      // If encountering an error, return 0.
      print("Erro: $e");
      return false;
    }
  }
  void addData(List<String> data, void Function(Vinho v) add){ 
    add(
      Vinho(
        nome: data[0],
        pais: data[1],
        regiao: data[2],
        tipo: data[3],
        safra: int.parse(data[4]),
        notaRP: data[5],
        notaWS: data[6],
        beberRP: data[7],
        etiqueta: data[8],
        quantidade: int.parse(data[9]),
      )
    );

  }
}