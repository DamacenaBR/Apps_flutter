import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _escolhaUsuario = "";

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
      title: Text("RaidoBotao"),
    );
  }

  _body() {
    return Container(
        child: Column(
      children: <Widget>[
        /*Text("Masculino"),
        Radio(
            value: "m",
            groupValue: _escolhaUsuario,
            onChanged: (String escolha) {
              print("Resultado: " + escolha);
              setState(() {
                _escolhaUsuario = escolha;
              });
            }),
        Text("Feminino"),
        Radio(
            value: "f",
            groupValue: _escolhaUsuario,
            onChanged: (String escolha) {
              print("Resultado: " + escolha);
              setState(() {
                _escolhaUsuario = escolha;
              });
            }),*/
        RadioListTile(
            title: Text("Masculino"),
            value: "m",
            groupValue: _escolhaUsuario,
            onChanged: (String escolha) {
              setState(() {
                _escolhaUsuario = escolha;
              });
            }),
            RadioListTile(
            title: Text("Feminino"),
            value: "f",
            groupValue: _escolhaUsuario,
            onChanged: (String escolha) {
              setState(() {
                _escolhaUsuario = escolha;
              });
            }),
            RadioListTile(
            title: Text("Indefinido"),
            value: "i",
            groupValue: _escolhaUsuario,
            onChanged: (String escolha) {
              setState(() {
                _escolhaUsuario = escolha;
              });
            }),
        RaisedButton(
            child: Text(
              "Salvar",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            color: Colors.lightBlue,
            onPressed: () {
              print("Resultado: " + _escolhaUsuario);
            }),
        Text(
          "Resultado: " + _escolhaUsuario,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    ));
  }

  _bottomNavigationBar() {
    return null;
  }
}
