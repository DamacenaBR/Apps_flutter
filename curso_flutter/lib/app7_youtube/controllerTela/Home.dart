import 'package:curso_flutter/app7_youtube/controllerTela/CustomSearchDelegate.dart';
import 'package:curso_flutter/app7_youtube/telas/Biblioteca.dart';
import 'package:curso_flutter/app7_youtube/telas/EmAlta.dart';
import 'package:curso_flutter/app7_youtube/telas/Inicio.dart';
import 'package:curso_flutter/app7_youtube/telas/Inscricao.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _resultado = "";
  int _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio( _resultado ),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: _appBar(),
      body: _body(telas),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(color: Colors.grey),
      title: Image.asset(
        "assets/imagens/app7_youtube.png",
        width: 98,
        height: 22,
      ),
      actions: <Widget>[
        /*
        _icons(Icon(Icons.video_call), () => print("ação: videocam")),
        _icons(Icon(Icons.search), () => print("ação: pesquia")),
        _icons(Icon(Icons.account_circle), () => print("ação: conta")),
        */

        IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String resPesquisa = await showSearch(
                  context: context, delegate: CustomSearchDelegate());

              setState(() {
                _resultado = resPesquisa;
              });
            }),
      ],
    );
  }

  _icons(Widget icon, Function function) {
    return IconButton(icon: icon, onPressed: function);
  }

  _body(List<Widget> telas) {
    return Container(
      padding: EdgeInsets.all(16),
      child: telas[_currentIndex],
    );
  }

  _bottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => _onTabTapped(index),
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          _bottomNavigationBarItem(Text("Inicio"), Icon(Icons.home)),
          _bottomNavigationBarItem(Text("Em alta"), Icon(Icons.whatshot)),
          _bottomNavigationBarItem(
              Text("Inscrições"), Icon(Icons.subscriptions)),
          _bottomNavigationBarItem(Text("Biblioteca"), Icon(Icons.folder)),
        ]);
  }

  _bottomNavigationBarItem(Widget title, Icon icon) {
    return BottomNavigationBarItem(
      title: title,
      icon: icon,
    );
  }

  _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
