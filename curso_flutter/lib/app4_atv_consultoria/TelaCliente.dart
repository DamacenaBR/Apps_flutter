import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  @override
  _TelaClienteState createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
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
      title: Text("Tela Cliente"),
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
                  Image.asset("assets/imagens/app4_detalhe_cliente.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      "Sobre Cliente",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Image.asset("assets/imagens/app4_cliente1.png"),
              ),
              Text("Empresa de software"),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Image.asset("assets/imagens/app4_cliente2.png"),
              ),
              Text("Empresa de auditoria"),
            ],
          )),
    );
  }

  _bottomNavigationBar(){
    return null;
  }
}