

import 'dart:convert';

import 'package:app_pizza/controller_json/bebida_json/babida_json.dart';
import 'package:flutter/services.dart';


class BebidaApi{
  static Future<List<BebidaJson>> getBebida() async{

    String dados = await rootBundle.loadString("assets/jsons/bebidas.json");

    List lista = jsonDecode(dados);

    List listaBebidas = List<BebidaJson>();

    for(Map map in lista){
      BebidaJson contato = BebidaJson.fromJson(map);
      listaBebidas.add(contato);
    }
    
    return listaBebidas;
  }
}