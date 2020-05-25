import 'package:app_pizza/controller_json/pizza_json/pizza_json.dart';
import 'package:app_pizza/controller_model/provider/mesa_provider.dart';
import 'package:app_pizza/model/pizza.dart';
import 'package:app_pizza/telas/tela_variados/tela_carrinho.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaPizza extends StatelessWidget {
  PizzaJson pizza;

  TelaPizza(this.pizza);
  String componete;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pizza.categoria,
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
      itemCount: pizza.pizzas.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(2),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  pizza.pizzas[index].nome,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "ENGREDIENTES: ${pizza.pizzas[index].componentes}",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                  maxLines: 1,
                ),
                trailing: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'R\$ ${pizza.pizzas[index].broto}',
                        style: TextStyle(fontSize: 13),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'R\$ ${pizza.pizzas[index].grande}',
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                        textAlign: TextAlign.justify,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _dialog(context, pizza.pizzas[index]);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _dialog(BuildContext context, Pizza pizza) {
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            FlatButton(
                              child: Text("Broto\nR\$ ${pizza.broto}"),
                              onPressed: () {
                                Provider.of<IncrementeCarrinho>(context)
                                    .checkMesaPizza(pizza.nome,
                                        pizza.componentes, pizza.broto);
                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text("Media\nR\$ ${pizza.media}"),
                              onPressed: () {
                                Provider.of<IncrementeCarrinho>(context)
                                    .checkMesaPizza(pizza.nome,
                                        pizza.componentes, pizza.media);
                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text("Grande\nR\$ ${pizza.grande}"),
                              onPressed: () {
                                Provider.of<IncrementeCarrinho>(context)
                                    .checkMesaPizza(pizza.nome,
                                        pizza.componentes, pizza.grande);
                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text("Sair"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
