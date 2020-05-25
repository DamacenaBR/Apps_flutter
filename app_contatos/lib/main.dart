
import 'package:app_contatos/lista_contatos_page.dart';
import 'package:flutter/material.dart';

void main() {
  //ContatoApi.getContatos();
  runApp(MaterialApp(
    home: ListaContatosPage(),
    debugShowCheckedModeBanner: false,
  ));
}