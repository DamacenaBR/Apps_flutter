import 'package:curso_flutter/app3_AlcoolOuGasolina/home.dart';
import 'package:flutter/material.dart';

void main(){
  
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}