import 'package:app_telefone/tela_splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaSplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}