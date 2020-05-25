
import 'package:app_contatos_exemplo/lista_contatos_page.dart';
import 'package:flutter/material.dart';

void main() {
  //ContatoApi.getContatos();
  runApp(MaterialApp(
    home: ListaContatosPage(),
    debugShowCheckedModeBanner: false,
  ));
}