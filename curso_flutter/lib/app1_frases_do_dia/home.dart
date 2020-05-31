import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = [
    "Frase 1",
    "Frase 2",
    "Frase 4",
    "Frase 5",
    "Frase 6",
    "Frase 7",
    "Frase 8",
    "Frase 9",
    "Frase 10",
  ];

  var _fraseGerada = "Nova Frase";

  void _gerarFrases() {
    var numeroSorteado = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text("Frases do dia"),
      backgroundColor: Colors.lightGreen,
    );
  }

  _body() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        //width: double.infinity,
        //decoration: BoxDecoration(border: Border.all(width: 3, color: Colors.amber)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/imagens/app1_logo.png"),
            Text(
              _fraseGerada,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
            ),
            RaisedButton(
              child: Text(
                "Nova Frase",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              color: Colors.lightGreen,
              onPressed: () {
                _gerarFrases();
              },
            )
          ],
        ),
      ),
    );
  }

  _bottomNavigationBar() {
    return null;
  }
}
