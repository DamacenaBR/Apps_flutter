import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      //floatingActionButton: _floatingActionButton(),
      floatingActionButton: _floatingActionButtonExtends(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _floatingActionButton(){
    return FloatingActionButton(
      backgroundColor: Colors.purple,
      child: Icon(Icons.add, color: Colors.white,),
      elevation: 10,
      onPressed: (){
        print("Teste foating action buttton!");
      });
  }

  _floatingActionButtonExtends() {
    return FloatingActionButton.extended(
      backgroundColor: Colors.purple,
      icon: Icon(Icons.add_shopping_cart),
      label: Text("Adicionar"),
     /*shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),*/
      onPressed: () {
        print("Teste foating action buttton extends!");
      },
    );
  }

  _bottomNavigationBar() {
    return BottomAppBar(
      //shape: CircularNotchedRectangle(),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: null
          ),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: Text("Lista de Tarefas"),
      centerTitle: true,
    );
  }

  _body() {
    return null;
  }
}
