
import 'package:curso_flutter/BD-sqflite/home.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(), //BD-sqflite
      debugShowCheckedModeBanner: false,
    );
  }
}