
import 'package:app_contatos_exemplo/contato.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class ContatoApi{
  static Future<List<Contato>> getContatos() async {
    String dados = await rootBundle.loadString("assets/jsons/contatos.json");

    List lista = json.decode(dados);

    List<Contato> listaContatos = List<Contato>();

    for(Map map in lista){
      Contato contato = Contato.fromJson(map);
      listaContatos.add(contato);
    }    
    return listaContatos;
    
  }
}