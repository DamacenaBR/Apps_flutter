import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  @override
  _TelaContatoState createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
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
      title: Text("Tela Contato"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("assets/imagens/app4_detalhe_contato.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      "Sobre Contato",
                      style: TextStyle(fontSize: 20,),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text("atendimento@atmconsultoria.com.br"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text("Telefone: (99) 9999-9999"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text("Celular: (99) 9999-9999"),
              ),
            ],
          )),
    );
  }

  _bottomNavigationBar(){
    return null;
  }
}