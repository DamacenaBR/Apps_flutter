import 'package:app_telefone/contato.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class TelaSecundaria extends StatelessWidget {
  Contato contato;

  TelaSecundaria(this.contato);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          contato.categoria,
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return ListView.builder(
      itemCount: contato.telefones.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Column(
            children: <Widget>[
              ListTile(
                  title: Text(
                    contato.telefones[index].nome,
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(contato.telefones[index].numero,
                      style: TextStyle(fontSize: 20)),
                  trailing: SingleChildScrollView(
                    child: Container(
                      width: 100,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              onPressed: () {
                                _launchTelefone(
                                    "tel", contato.telefones[index].numero);
                              },
                              icon: Icon(
                                Icons.phone,
                                color: Colors.green,
                              )),
                          IconButton(
                              onPressed: () {
                                _lauchCompartilhar(
                                    contato.telefones[index].nome,
                                    contato.telefones[index].numero);
                              },
                              icon: Icon(
                                Icons.share,
                                color: Colors.red,
                              ))
                        ],
                      ),
                    ),
                  )),
              Divider()
            ],
          ),
        );
      },
    );
  }

  _launchTelefone(String tipo, String contato) async {
    await launch("$tipo: $contato");
  }

  _lauchCompartilhar(String nome, String numero) async {
    await Share.share("Nome do contato: $nome\n Número: $numero");
  }
}
