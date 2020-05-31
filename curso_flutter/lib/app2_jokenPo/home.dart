import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _imagemApp = AssetImage("assets/imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

    _escolhaApp(escolhaApp);
    _testeVitoria(escolhaUsuario, escolhaApp);
  }

  void _escolhaApp(String escolhaApp){
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("assets/imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("assets/imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("assets/imagens/tesoura.png");
        });
        break;
    }
  }

  void _testeVitoria(String escolhaUsuario, String escolhaApp) {
    if (_logicaVitoriaUsuario(escolhaUsuario, escolhaApp)) {
      setState(() {
        _mensagem = "Parabéns você ganhou :)";
      });
    } else if (_logicaVitoriaApp(escolhaUsuario, escolhaApp)) {
      setState(() {
        _mensagem = "Você Perdeu :(";
      });
    } else {
      setState(() {
        _mensagem = "Empatamos ;)";
      });
    }
  }

  bool _logicaVitoriaUsuario(String escolhaUsuario, String escolhaApp) {
    return ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel"));
  }

  bool _logicaVitoriaApp(String escolhaUsuario, String escolhaApp){
    return ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel"));
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
      title: Text("JokenPo"),
      backgroundColor: Colors.lightGreen,
    );
  }

  _body() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            "Escolha do App:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Image(
          image: this._imagemApp,
          height: 120,
        ),
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            _mensagem,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () => _opcaoSelecionada("pedra"),
              child: Image.asset(
                "assets/imagens/pedra.png",
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () => _opcaoSelecionada("papel"),
              child: Image.asset(
                "assets/imagens/papel.png",
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () => _opcaoSelecionada("tesoura"),
              child: Image.asset(
                "assets/imagens/tesoura.png",
                height: 100,
              ),
            ),
          ],
        )
      ],
    );
  }

  _bottomNavigationBar() {
    return null;
  }
}