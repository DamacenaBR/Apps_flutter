import 'package:app_pizza/controller_json/pizza_json/pizza_json.dart';
import 'package:app_pizza/controller_json/pizza_json/pizza_json_api.dart';
import 'package:app_pizza/telas/tela_pizza/tela_secundaria_pizza.dart';
import 'package:flutter/material.dart';

class TelaPrincipalPizza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pizzas",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.blue,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return FutureBuilder(
      future: PizzaApi.getPizza(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          );
        }
        List<PizzaJson> listaPizzas = snapshot.data;
        return _listView(listaPizzas);
      },
    );
  }

  _listView(List<PizzaJson> listaPizzas) {
    return ListView.builder(
      itemCount: listaPizzas.length,
      itemBuilder: (context, index) {
        return _itemList(context, listaPizzas[index], index);
      },
    );
  }

  _itemList(BuildContext context, PizzaJson listaPizza, int index) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: index == 0 ? EdgeInsets.all(10) : null,
              child: index == 0 ? Card(
                child: Image.asset(
                    "assets/imagens/imagem_pizza3.jpg"),
              )  : null,
            ),
            Container(
              padding: index == 0 ? EdgeInsets.all(10) : null,
              child: index == 0
                  ? Text("Categorias",
                      style: TextStyle(fontSize: 20, color: Colors.blue))
                  : null,
            ),
            ListTile(
              leading: CircleAvatar(
                child: Text(
                  listaPizza.categoria[0],
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
              title: Text(
                listaPizza.categoria,
                style: TextStyle(fontSize: 22),
              ),
              trailing: Icon(
                Icons.chevron_right,
                size: 30,
                color: Colors.blue,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TelaPizza(listaPizza);
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
