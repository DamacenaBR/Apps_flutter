import 'package:curso_flutter/app10_aprenda_ingles/Home.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(), //Aprenda ingês
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xff795548),
          scaffoldBackgroundColor: Color(0xfff5e9b9)),
    );
  }
}
