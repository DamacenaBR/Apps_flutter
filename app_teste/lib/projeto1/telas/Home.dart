import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'RouteGenerator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

User firebaseUser;

class _HomeState extends State<Home> {
  @override
  void initState() {
    _verificarAutenticacao();
    super.initState();
  }

  _verificarAutenticacao() async {
    User user = await FirebaseAuth.instance.currentUser;
    setState(() {
      firebaseUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      title: Text("WhatsApp"),
      actions: [
        IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _deslogarUsuario();
            })
      ],
    );
  }

  _deslogarUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
    Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_LOGIN);
  }

  _body() {
    return firebaseUser != null
        ? Container(
            child: Center(
              child: Text(firebaseUser.emailVerified
                  ? "Email verificado"
                  : "Email não verificado"),
            ),
          )
        : Text("Não carregado");
  }
}
