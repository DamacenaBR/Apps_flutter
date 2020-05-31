import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool _escolhaUsuario = false;
  bool _escolhaConfig = false;
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
          /*Switch(
            value: _escolhaUsuario, 
            onChanged: (bool value){
              setState(() {
                _escolhaUsuario = value;
              });
            }
          ),
          Text("Receber Notificações?"),
          Text("Resultado: " + _escolhaUsuario.toString())
          */

          SwitchListTile(
            title: Text("Receber Notificações?"),           
            value: _escolhaUsuario,
            onChanged: (bool value){
              setState(() {
                _escolhaUsuario = value;
              });
            }),
            SwitchListTile(
            title: Text("Caregar imagem automaticamente?"),
            value: _escolhaConfig,
            onChanged: (bool value){
              setState(() {
                _escolhaConfig = value;
              });
            }),
            RaisedButton(
            child: Text(
              "Salvar",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            color: Colors.lightBlue,
            onPressed: () {
              print("Escolha usuario: " + _escolhaUsuario.toString());
              print("Escolha config: " + _escolhaConfig.toString());
            }),
            Text("Escolha usuario: " + _escolhaUsuario.toString()),
            Text("Escolha config: " + _escolhaConfig.toString()),
        ],
      ),
    );
  }

  _bottomNavigationBar() {
    return null;
  }
}
