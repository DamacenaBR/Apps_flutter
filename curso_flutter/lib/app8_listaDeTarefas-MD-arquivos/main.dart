import 'package:curso_flutter/app8_listaDeTarefas-MD-arquivos/Home.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(), //floating action buttom
      debugShowCheckedModeBanner: false,
    );
  }
}