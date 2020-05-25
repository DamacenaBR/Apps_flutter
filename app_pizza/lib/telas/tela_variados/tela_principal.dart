import 'package:app_pizza/controller_bd/empresa/empresaHelper.dart';
import 'package:app_pizza/controller_model/provider/empresa_provider.dart';
import 'package:app_pizza/controller_model/provider/mesa_provider.dart';
import 'package:app_pizza/model/empresa.dart';
import 'package:app_pizza/telas/telasController/tela_controller_bebidas.dart';
import 'package:app_pizza/telas/telasController/tela_controller_pizza.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Principal",
          style: TextStyle(fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              _dialog(context);
            },
          )
        ],
        backgroundColor: Colors.blue,
      ),
      body: _body(context),
      drawer: _drawer(),
    );
  }

  _drawer() {
    return Consumer<IncrementeEmpresa>(
        builder: (context, incrementeEmpresa, child) {
      incrementeEmpresa.recuperarEmpresa();
      return Drawer(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  "assets/imagens/logo_pizza.png",
                ),
              ),
              otherAccountsPictures: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _dialog2();
                  },
                )
              ],
              accountEmail: incrementeEmpresa.empresa != null
                  ? Text('${incrementeEmpresa.empresa[0].email}')
                  : Text("Email"),
              accountName: incrementeEmpresa.empresa != null
                  ? Text(
                      '${incrementeEmpresa.empresa[0].nome}',
                      style: TextStyle(fontSize: 18),
                    )
                  : Text("Nome"),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[],
            ),
          ],
        ),
      ));
      ;
    });
  }

  _body(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
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
                            border: Border.all(color: Colors.blue, width: 2.0),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return TelaControllerPizza();
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
                            border: Border.all(color: Colors.blue, width: 2.0),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return TelaControllerBebidas();
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
    );
  }

  _dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                title: Text("Informações Pizzas"),
                content: Text(
                    "Pizza Broto: 04 Fatias - 01 sabor\n\nPizza Média: 06 Fatias - 02 sabores\n\nPizza Grande: 09 Farias - 3 sabores",
                    style: TextStyle(fontSize: 15)),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15),
                    side: BorderSide(color: Colors.blue)),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "Sair",
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

  _dialog2() {
    return Builder(
      builder: (BuildContext context) {
        showDialog(
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                  child: AlertDialog(
                title: Text("Atualizar Dados"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _nomeController,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: "Nome", hintText: "Digite o nome..."),
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: "Email", hintText: "Digite o email..."),
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15),
                    side: BorderSide(color: Colors.blue)),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancelar")),
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Salvar"))
                ],
              ));
            });
      },
    );
  }
}
