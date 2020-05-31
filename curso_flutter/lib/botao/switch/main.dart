import 'package:curso_flutter/botao/switch/switch.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(), //Swuitch
      debugShowCheckedModeBanner: false,
    );
  }
}