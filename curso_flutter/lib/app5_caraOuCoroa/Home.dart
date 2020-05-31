import 'dart:math';

import 'package:curso_flutter/app5_caraOuCoroa/TelaSecundaria.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void navegarEntreTelas(dynamic tela) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => tela));
  }

  String _gerarNumero(){
    var itens = ["cara","coroa"];
    var numero = Random().nextInt(itens.length);
    return itens[numero];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _appBar() {
    return null;
  }

  _body() {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset("assets/imagens/app5_logo.png"),
              GestureDetector(
                onTap: () => navegarEntreTelas(TelaSecundaria(_gerarNumero())),
                child: Image.asset("assets/imagens/app5_botao_jogar.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _bottomNavigationBar() {
    return null;
  }
}
