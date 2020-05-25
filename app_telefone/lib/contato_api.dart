

import 'dart:convert';

import 'package:flutter/services.dart';

import 'contato.dart';

class ContatoApi{
  static Future<List<Contato>> getContato() async{

    String dados = await rootBundle.loadString("assets/jsons/telefones.json");

    List lista = jsonDecode(dados);

    List listaContatos = List<Contato>();

    for(Map map in lista){
      Contato contato = Contato.fromJson(map);
      listaContatos.add(contato);
    }
    
    return listaContatos;
  }
}