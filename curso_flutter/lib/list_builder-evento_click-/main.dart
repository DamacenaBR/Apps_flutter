import 'package:curso_flutter/list_builder-evento_click-/home.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(), //Alerta
      debugShowCheckedModeBanner: false,
    );
  }
}