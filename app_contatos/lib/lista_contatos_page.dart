import 'package:app_contatos/contato.dart';
import 'package:app_contatos/contato_api.dart';
import 'package:flutter/material.dart';

import 'contato_page.dart';

class ListaContatosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  _body() {
    return FutureBuilder(
      future: ContatoApi.getContatos(),
      builder: (context, snapshot) {
        List<Contato> listaContatos = snapshot.data;
        return _listView(listaContatos);
      },
    );
  }

  _listView(List<Contato> listaContatos) {
    return ListView.builder(
      itemCount: listaContatos.length,
      itemBuilder: (context, index) {
        return _itemList(context, listaContatos[index]);
      },
    );
  }

  _itemList(BuildContext context, Contato contato) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) {
            return ContatoPage(contato);
          }));

      },
      child: Column(
        children: <Widget>[
          Text(contato.nome),
          Text(contato.email),
          Text(contato.telefone),
          Divider(),
        ],
      ),
    );
  }
}
