
import 'package:curso_flutter/dismissible-arrasta_e_apagar/Home.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(), //Dismissible
      debugShowCheckedModeBanner: false,
    );
  }
}