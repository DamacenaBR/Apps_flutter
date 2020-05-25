import 'package:app_projeto_pizzaria/model/pizza.dart';
import 'package:app_projeto_pizzaria/provider/controller_provider.dart';
import 'package:app_projeto_pizzaria/telas/tela_variados/tela_carrinho.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaPizza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Lista de Pizzas",
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
      future: _recuperarPizzasBD(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          );
        }
        List<Pizza> listaPizzas = snapshot.data;
        return _listView(listaPizzas);
      },
    );
  }

  _listView(List<Pizza> listaPizzas) {
    return ListView.builder(
      itemCount: listaPizzas.length,
      itemBuilder: (BuildContext context, int index) {
        return _itemList(listaPizzas, index, context);
      },
    );
  }

  _itemList(List<Pizza> listaPizzas, int index, BuildContext context){
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(2),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  "${listaPizzas[index].numero} - ${listaPizzas[index].nome}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "ENGREDIENTES: ${listaPizzas[index].componentes}",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                  maxLines: 1,
                ),
                trailing: Column(
                    children: <Widget>[
                      Text(
                        'R\$ ${listaPizzas[index].broto}',
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        'R\$ ${listaPizzas[index].grande}',
                        style: TextStyle(fontSize: 15, color: Colors.blue)
                      ),
                    ],
                  ),
                onTap: () {
                  _dialogAdicionarPizza(context, listaPizzas[index]);
                },
              ),
            ],
          ),
        ),
    );
  }

  _dialogAdicionarPizza(BuildContext context, Pizza pizza) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                title: Text("Deseja adicionar a pizza no carrinho?"),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15),
                    side: BorderSide(color: Colors.blue)),
                content: Text(
                  "Nome: ${pizza.nome}\n\nENGREDIENTES: ${pizza.componentes}",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                  maxLines: 5,
                ),
                actions: <Widget>[
                  Container(
                      child: Center(
                          child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          FlatButton(
                            child: Text("Broto\nR\$ ${pizza.broto}"),
                            onPressed: () {
                              Provider.of<IncrementeProvider>(context)
                                  .adicionarPizzaCarrinho(pizza.nome, "Broto",
                                      pizza.componentes, pizza.broto);
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            child: Text("Media\nR\$ ${pizza.media}"),
                            onPressed: () {
                              Provider.of<IncrementeProvider>(context)
                                  .adicionarPizzaCarrinho(pizza.nome, "Média",
                                      pizza.componentes, pizza.media);
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            child: Text("Grande\nR\$ ${pizza.grande}"),
                            onPressed: () {
                              Provider.of<IncrementeProvider>(context)
                                  .adicionarPizzaCarrinho(pizza.nome, "Grande",
                                      pizza.componentes, pizza.grande);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      FlatButton(
                        child: Text("Cancelar"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )))
                ],
              ),
            ),
          );
        });
  }

  Future<List<Pizza>> _recuperarPizzasBD() async {
    Firestore db = Firestore.instance;
    QuerySnapshot querySnapshot = await db
        .collection("pizzas")
        .orderBy("numero", descending: false)
        .getDocuments();

    List<Pizza> listaPizzas = List<Pizza>();
    for (DocumentSnapshot item in querySnapshot.documents) {
      var dados = item.data;
      Pizza p = Pizza.fromJson(dados);
      listaPizzas.add(p);
    }
    return listaPizzas;
  }
}
