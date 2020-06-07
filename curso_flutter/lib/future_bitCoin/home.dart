import 'package:curso_flutter/future_bitCoin/brasil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<BRL> _recuperarBitCoin(String pais) async {
    String url = "https://blockchain.info/ticker";
    http.Response responde = await http.get(url);

    if (responde.statusCode == 200) {
      Map<String, dynamic> mapResposta = jsonDecode(responde.body);
      return BRL.fromJson(mapResposta[pais]);
    } else {
      return null;
    }
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
      title: Text("Future BitCoin"),
    );
  }

  _body() {
    return FutureBuilder<BRL>(
        future: _recuperarBitCoin("BRL"),
        builder: (context, snapshot) {
          String resultado;
          switch (snapshot.connectionState) {
            case ConnectionState.none: //estado da conexão nulo
            case ConnectionState.waiting: //estado da conexão carregando
              resultado = "Carregando...";
              break;
            case ConnectionState
                .active: //se mantem rebendo dados por um tempo utilizando em stream, continua ativo
            case ConnectionState
                .done: //terminou o processo de recuperação de dados
              if (snapshot.hasError) {
                resultado = "Erro ao carregar os dados.";
              } else {
                BRL brl = snapshot.data;
                double valor = brl.buy;
                resultado = "Preço do bitcoin: ${valor.toString()} ";
              }
              break;
          }
          return Center(
            child: Text(resultado),
          );
        });
  }

  _bottomNavigationBar() {
    return null;
  }
}
