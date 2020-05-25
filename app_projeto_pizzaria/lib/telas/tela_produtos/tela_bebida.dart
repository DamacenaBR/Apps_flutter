import 'package:app_projeto_pizzaria/model/bebidas.dart';
import 'package:app_projeto_pizzaria/provider/controller_provider.dart';
import 'package:app_projeto_pizzaria/telas/tela_variados/tela_carrinho.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaBebidas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Lista de Bebidas",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.blue,
      ),
      body: _body(context),
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

  _body(BuildContext context) {
    return FutureBuilder(
      future: _recuperarBebidasBD(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          );
        }
        List<Bebida> listaBebidas = snapshot.data;
        return _listView(listaBebidas);
      },
    );
  }

  _listView(List<Bebida> listaBebidas){
    return ListView.builder(
      itemCount: listaBebidas.length,
      itemBuilder: (BuildContext context, int index) {
        return _itemList(listaBebidas, index, context);
      },
    );
  }

  _itemList(List<Bebida> listaBebidas, int index, BuildContext context) {
    return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(2),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("${listaBebidas[index].numero} - ${listaBebidas[index].nome} ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'TAMANHO: ${listaBebidas[index].tamanho}',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                    maxLines: 1,
                  ),
                  trailing: Text(
                    'R\$ ${listaBebidas[index].preco.toString()}',
                    style: TextStyle(fontSize: 14)
                  ),
                  onTap: () {
                    _dialogAdicionarBebidas(context, listaBebidas[index]);
                  },
                ),
              ],
            ),
          ),
        );
  }

  _dialogAdicionarBebidas(BuildContext context, Bebida bebida) {
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
                  "Nome: ${bebida.nome}\nTamanho: ${bebida.tamanho}\nValor: R\$ ${bebida.preco}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),                
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "Confirmar",
                      style: TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Provider.of<IncrementeProvider>(context)
                          .adicionarBebidasCarrinho(bebida.nome, bebida.tamanho, bebida.descricao, bebida.preco);
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text(
                      "Cancelar",
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

  Future<List<Bebida>> _recuperarBebidasBD() async {
    Firestore db = Firestore.instance;
    QuerySnapshot querySnapshot = await db
        .collection("bebidas")
        .orderBy("numero", descending: false)
        .getDocuments();

    List<Bebida> listaBebidas = List<Bebida>();
    for (DocumentSnapshot item in querySnapshot.documents) {
      var dados = item.data;
      Bebida p = Bebida.fromJson(dados);
      listaBebidas.add(p);
    }
    return listaBebidas;
  }

}