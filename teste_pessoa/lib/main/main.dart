
import 'package:flutter/material.dart';
import 'package:teste_pessoa/telas/tela_principal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaPrincipal(),
      debugShowCheckedModeBanner: false,
    );
  }
}