import 'package:curso_flutter/app9_notas_diarias-sqflite/view/Home.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(), //Notas Diarias - BD-sqflite
      debugShowCheckedModeBanner: false,
    );
  }
}