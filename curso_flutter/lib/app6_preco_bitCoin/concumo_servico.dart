import 'package:curso_flutter/app6_preco_bitCoin/brasil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _preco = "0";

  _recuperarPreco(String pais) async {
    String url = "https://blockchain.info/ticker";

    http.Response responde = await http.get(url);
    Map<String, dynamic> retorno = json.decode(responde.body);
    BRL _br = BRL.fromJson(retorno[pais]);
    setState(() {
      _preco = _br.buy.toString();
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
      backgroundColor: Colors.orange,
      title: Text("BitCoin"),
    );
  }

  _body() {
    return Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/imagens/app6_bitcoin.png"),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  "R\$ " + _preco,
                  style: TextStyle(fontSize: 35),
                ),
              ),
              RaisedButton(
                  color: Colors.orange,
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child: Text(
                    "Atualizar",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _recuperarPreco("BRL");
                  }),
            ],
          ),
        ));
  }

  _bottomNavigationBar() {
    return null;
  }
}