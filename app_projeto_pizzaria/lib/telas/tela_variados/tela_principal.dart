import 'dart:io';
import 'package:app_projeto_pizzaria/provider/controller_provider.dart';
import 'package:app_projeto_pizzaria/telas/tela_pedidos/tela_pedidos_realizados.dart';
import 'package:app_projeto_pizzaria/telas/tela_produtos/tela_bebida.dart';
import 'package:app_projeto_pizzaria/telas/tela_produtos/tela_pizza.dart';
import 'package:app_projeto_pizzaria/telas/tela_variados/tela_vendaFinalida.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  String _nome;
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
              "Fast Pizza",
              style: TextStyle(fontSize: 25),
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
                    leading: Icon(Icons.list),
                    title: Text(
                      "Lista de pedidos",
                      style: TextStyle(fontSize: 17),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 30,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return TelaPedidosEmAndamento();
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.list),
                    title: Text(
                      "Lista de vendas",
                      style: TextStyle(fontSize: 17),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 30,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return TElaVendaFinalizada();
                      }));
                    },
                  ),
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

  _body(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Card(
                      child: Image.asset("assets/imagens/pizza2.jpg"),
                    ),
                    Divider(
                      color: Colors.transparent,
                    ),
                    Text("Categorias",
                        style: TextStyle(fontSize: 20, color: Colors.blue)),
                  ],
                ),
              ),
              Divider(
                color: Colors.transparent,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.blue, width: 2.0),
                            ),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return TelaPizza();
                                }));
                              },
                              child: Image.asset(
                                "assets/imagens/icons_pizza.png",
                              ),
                            )),
                        Divider(
                          color: Colors.transparent,
                        ),
                        Text("Pizzas",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.blue, width: 2.0),
                            ),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return TelaBebidas();
                                }));
                              },
                              child: Image.asset(
                                "assets/imagens/icons_bebidas.png",
                              ),
                            )),
                        Divider(
                          color: Colors.transparent,
                        ),
                        Text("Bebidas",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
