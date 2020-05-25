import 'package:flutter/material.dart';

import 'contato.dart';

class ContatoPage extends StatelessWidget {

  Contato contato;
  ContatoPage(this.contato);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(contato.nome),
            Text(contato.email),
            Text(contato.telefone)
        ],),
      )
    );
  }
}
