import 'package:app_chat/telas/AbaContatos.dart';
import 'package:app_chat/telas/AbaConversas.dart';
import 'package:app_chat/telas/RouteGenerator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> _itensMenu = ["Configurações", "Deslogar"];
  String _emailUsuario = "";

  Future _recuperarDadosUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();
    setState(() {
      _emailUsuario = usuarioLogado.email;
    });
  }

  _escolhaMenuItem(String itemEscolhido) {
    switch (itemEscolhido) {
      case "Configurações":
        Navigator.pushNamed(context, RouteGenerator.ROTA_CONFIGURACOES);
        break;
      case "Deslogar":
        _deslogarUsuario();
        break;
    }
  }

  _deslogarUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
    Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_LOGIN);
  }

  Future _verificaUsuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();
    if (usuarioLogado == null) {
      Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_LOGIN);
    }
  }

  @override
  void initState() {
    super.initState();
    _verificaUsuarioLogado();
    _recuperarDadosUsuario();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
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
      bottom: TabBar(
        controller: _tabController,
        indicatorWeight: 4,
        indicatorColor: Colors.white,
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        tabs: <Widget>[
          Tab(
            text: "Conversas",
          ),
          Tab(
            text: "Contatos",
          )
        ],
      ),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: _escolhaMenuItem,
          itemBuilder: (context) {
            return _itensMenu.map((String item) {
              return PopupMenuItem<String>(value: item, child: Text(item));
            }).toList();
          },
        )
      ],
    );
  }

  _body() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[AbaConversas(), AbaContatos()],
    );
  }
}
