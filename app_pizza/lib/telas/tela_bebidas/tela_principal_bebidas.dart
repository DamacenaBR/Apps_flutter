import 'package:app_pizza/controller_json/bebida_json/babida_json.dart';
import 'package:app_pizza/controller_json/bebida_json/bebida_json_api.dart';
import 'package:app_pizza/telas/tela_bebidas/tela_secundaria_bebidas.dart';
import 'package:flutter/material.dart';

class TelaPrincipalBebidas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Bebidas",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.blue,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return FutureBuilder(
      future: BebidaApi.getBebida(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          );
        }
        List<BebidaJson> listaBebidas = snapshot.data;
        return _listView(listaBebidas);
      },
    );
  }

  _listView(List<BebidaJson> listaBebidas) {
    return ListView.builder(
      itemCount: listaBebidas.length,
      itemBuilder: (context, index) {
        return _itemList(context, listaBebidas[index], index);
      },
    );
  }

  _itemList(BuildContext context, BebidaJson listaBebidas, int index) {
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
                    "assets/imagens/imagem_bebidas.jpg"),
              )   : null,
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
                  listaBebidas.categoria[0],
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
              title: Text(
                listaBebidas.categoria,
                style: TextStyle(fontSize: 22),
              ),
              trailing: Icon(
                Icons.chevron_right,
                size: 30,
                color: Colors.blue,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TelaBebida(listaBebidas);
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
