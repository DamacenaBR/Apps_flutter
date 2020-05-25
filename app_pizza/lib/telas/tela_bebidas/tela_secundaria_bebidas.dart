import 'package:app_pizza/controller_json/bebida_json/babida_json.dart';
import 'package:app_pizza/controller_model/provider/mesa_provider.dart';
import 'package:app_pizza/model/bebidas.dart';
import 'package:app_pizza/telas/tela_variados/tela_carrinho.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaBebida extends StatelessWidget {
  BebidaJson bebida;

  TelaBebida(this.bebida);
  String valor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          bebida.categoria,
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.shopping_cart,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TelaCarrinho();
          }));
        },
      ),
    );
  }

  _body() {
    return ListView.builder(
      itemCount: bebida.bebidas.length,
      itemBuilder: (BuildContext context, int index) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: index == 0 ? EdgeInsets.all(10) : null,
                  child: index == 0
                      ? Text("Bebidas",
                          style: TextStyle(fontSize: 20, color: Colors.blue))
                      : null,
                ),
                ListTile(
                  title: Text(
                    bebida.bebidas[index].nome,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'DESCRIÇÃO: ${bebida.bebidas[index].descricao.toString()}',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                    maxLines: 2,
                  ),
                  trailing: Text(
                    'R\$ ${bebida.bebidas[index].preco.toString()}',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                    maxLines: 2,
                  ),
                  onTap: () {
                    _dialog(context, bebida.bebidas[index]);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _dialog(BuildContext context, Bebida bebida) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                title: Text("Adiconar a bebida no carrinho?"),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15),
                    side: BorderSide(color: Colors.blue)),
                content: Text(
                  "Nome: ${bebida.nome}\nValor: R\$ ${bebida.preco}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "Sim",
                      style: TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Provider.of<IncrementeCarrinho>(context)
                          .checkMesaBebidas(bebida.nome, bebida.descricao, bebida.preco);
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text(
                      "Cancelar!",
                      style: TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
