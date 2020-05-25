import 'dart:io';
import 'package:app_projeto_pizzaria2/model/pedido.dart';
import 'package:app_projeto_pizzaria2/provider/controller_provider.dart';
import 'package:app_projeto_pizzaria2/telas/tela_pedidos_realizados.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<IncrementeProvider>(
          builder: (context, incrementePedido, child) {
            return Text(
              "Pedidos",
              style: TextStyle(fontSize: 25),
            );
          },
        ),
        backgroundColor: Colors.blue,
      ),
      body: _body(context),
      drawer: _drawer(),
    );
  }

  _drawer() {
    return Drawer(
      child: Consumer<IncrementeProvider>(
          builder: (context, incrementeProduto, child) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: Firestore.instance
                    .collection('empresa')
                    .document('001')
                    .get(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    DocumentSnapshot document = snap.data;
                    return _userHeader(document.data['email'],
                        document.data['nome'], incrementeProduto);
                  }
                  return _userHeader(
                      "carregando...", "carregando...", incrementeProduto);
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text(
                      "Sair",
                      style: TextStyle(fontSize: 17),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 30,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      exit(0);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  _userHeader(
      String email, String nome, IncrementeProvider incrementeCarrinho) {
    return UserAccountsDrawerHeader(
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset(
          "assets/imagens/logo_pizza.png",
        ),
      ),
      accountEmail: Text(email),
      accountName: Text(nome),
    );
  }

  List<int> listMesa = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  _body(BuildContext context) {
    return _listView(listMesa);
  }

  _listView(List<int> listMesa) {
    return ListView.builder(
      itemCount: listMesa.length,
      itemBuilder: (context, index) {
        return _itemList(context, listMesa[index], index);
      },
    );
  }

  _itemList(BuildContext context, int numMesa, int index) {
    return SingleChildScrollView(child: Consumer<IncrementeProvider>(
        builder: (context, incrementePedido, child) {
      return Container(
        padding: EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: index == 0 ? EdgeInsets.all(10) : null,
              child: index == 0
                  ? Text("Lista de mesas",
                      style: TextStyle(fontSize: 20, color: Colors.blue))
                  : null,
            ),
            ListTile(
              leading: CircleAvatar(
                child: Text(
                  "${numMesa}",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
              title: Text(
                "Mesa ${numMesa}",
                style: TextStyle(fontSize: 22),
              ),
              trailing: _futureBuilder(incrementePedido, numMesa),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TelaPedidosRealizados(numMesa.toString());
                }));
              },
            ),
          ],
        ),
      );
    }));
  }

  _futureBuilder(IncrementeProvider incrementePedido, int numMesa) {
    return FutureBuilder(
      future: incrementePedido.recuperarPedidosBD(numMesa.toString()),
      builder: (context, snap) {
        if (snap.hasData) {
          List<Pedido> p = snap.data;
          int pedidoAndam = somarElemento(p);
          return Container(
              height: 20,
              width: 40,
              color: pedidoAndam > 0
                  ? Colors.red
                  : p.length > 0 ? Colors.green : null,
              child: Center(
                child: pedidoAndam > 0 ? Text(
                  "${pedidoAndam}",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ) : Text(
                  "${p.length}",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ));
        } else {
          return Container(
              height: 20,
              width: 40,
              child: Center(
                child: null,
              ));
        }
      },
    );
  }

  int somarElemento(List<Pedido> listPedido) {
    int somar = 0;
    for (int i = 0; i < listPedido.length; i++) {
      if (listPedido[i].status == "Em preparo") {
        somar++;
      }
    }
    return somar;
  }

}
