import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _lista = [
    "Bruno",
    "Andreia",
    "Mayara",
    "Felipe",
    "Gutemberg",
    "Danilo",
    "Lael",
    "Daniel",
    "João",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors.purple,
      title: Text("Dismissible"),
      centerTitle: true,
    );
  }

  _body() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[Expanded(child: _listViewBuilder(_lista))],
      ),
    );
  }

  _listViewBuilder(List lista) {
    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return _listView(lista[index], index);
        });
  }

  _listView(String item, int index) {
    return Dismissible(
        background: _containerDismissible(
            MainAxisAlignment.start,
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Colors.green),
        secondaryBackground: _containerDismissible(
            MainAxisAlignment.end,
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Colors.red),
        direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            print('Direção: startToEnd');
          } else if (direction == DismissDirection.endToStart) {
            print('Direção: endToStart');
          }
          setState(() {
            _lista.removeAt(index);
          });
        },
        key: Key(item + index.toString()),
        child: ListTile(
          title: Text(
            item,
            style: TextStyle(fontSize: 20),
          ),
        ));
  }

  _containerDismissible(
      MainAxisAlignment mainAxisAlignment, dynamic icon, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: <Widget>[icon],
      ),
      color: color,
    );
  }
}
