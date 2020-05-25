

import 'dart:convert';

import 'package:app_pizza/controller_json/pizza_json/pizza_json.dart';
import 'package:flutter/services.dart';


class PizzaApi{
  static Future<List<PizzaJson>> getPizza() async{

    String dados = await rootBundle.loadString("assets/jsons/pizzas.json");

    List lista = jsonDecode(dados);

    List listaPizzas = List<PizzaJson>();

    for(Map map in lista){
      PizzaJson contato = PizzaJson.fromJson(map);
      listaPizzas.add(contato);
    }
    
    return listaPizzas;
  }
}