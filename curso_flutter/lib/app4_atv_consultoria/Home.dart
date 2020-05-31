import 'package:curso_flutter/app4_atv_consultoria/TelaCliente.dart';
import 'package:curso_flutter/app4_atv_consultoria/TelaContato.dart';
import 'package:curso_flutter/app4_atv_consultoria/TelaEmpresa.dart';
import 'package:curso_flutter/app4_atv_consultoria/TelaServico.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _navegarEntreTelas(dynamic tela) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => tela));
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
      title: Text("ATM Consultoria"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Image.asset("assets/imagens/app4_logo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _navegarEntreTelas(TelaEmpresa()),
                    child: Image.asset("assets/imagens/app4_menu_empresa.png"),
                  ),
                  GestureDetector(
                    onTap: () => _navegarEntreTelas(TelaServico()),
                    child: Image.asset("assets/imagens/app4_menu_servico.png"),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => _navegarEntreTelas(TelaCliente()),
                      child:
                          Image.asset("assets/imagens/app4_menu_cliente.png"),
                    ),
                    GestureDetector(
                      onTap: () => _navegarEntreTelas(TelaContato()),
                      child:
                          Image.asset("assets/imagens/app4_menu_contato.png"),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  _bottomNavigationBar() {
    return null;
  }
}
