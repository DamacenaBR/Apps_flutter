
import 'package:curso_flutter/app1_frases_do_dia/home.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Frases do dia",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}