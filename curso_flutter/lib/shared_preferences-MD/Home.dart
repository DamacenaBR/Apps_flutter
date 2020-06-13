import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _textoSalvo = "Nada Salvo";
  TextEditingController _controllerCampo = TextEditingController();
  _salvar() async {
    String valorDigitado = _controllerCampo.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado.length == 0 ? "Digite o valor" : valorDigitado);

    print("operação (salvar): ${valorDigitado}");
  }

  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _textoSalvo = prefs.getString("nome") ?? "Sem Valor";
    });
    print("operação (recuperar): ${_textoSalvo}");
  }

  _remover() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");

    print("operação (remover)");

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
      backgroundColor: Colors.blue,
      title: Text("Preferencias"),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        children: <Widget>[
          Text(
            _textoSalvo,
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            keyboardType: TextInputType.text,
            controller: _controllerCampo,
            decoration: InputDecoration(
              labelText: "Digite algo",
            ),
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                  child: Text(
                    "Salvar",
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  onPressed: () => _salvar()),
              RaisedButton(
                  child: Text(
                    "Recuperar",
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Colors.green,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  onPressed: () => _recuperar()),
              RaisedButton(
                  child: Text(
                    "Remover",
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Colors.red,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  onPressed: () => _remover()),
            ],
          )
        ],
      ),
    );
  }

  _bottomNavigationBar() {
    return null;
  }
}
