import 'package:app_secretaria/telas/tela_splash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  /*Firestore.instance.
  collection("usuarios").
  document("001").
  setData(
   {"nome":"Felipe"} 
  );
  */
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