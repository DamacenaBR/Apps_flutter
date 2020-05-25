import 'package:app_share_splash/principal_page.dart';
import 'package:flutter/material.dart';

class SplasPage extends StatefulWidget {
  @override
  _SplasPageState createState() => _SplasPageState();
}

class _SplasPageState extends State<SplasPage> {
  @override
  void initState() {
    super.initState();
    _transitaProximaPagina();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  void _transitaProximaPagina() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return TelaPrincipal();
    }));
  }

  _body() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Carregando"),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
