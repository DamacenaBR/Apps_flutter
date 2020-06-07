import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> _listInteiro = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blue,
      title: Text("List Builder"),
    );
  }

  _body(BuildContext context) {
    return _listViewBuilder(_listInteiro);
  }

  _listViewBuilder(List<int> inteiro) {
    return ListView.builder(
        itemCount: inteiro.length,
        itemBuilder: (context, index) {
          return _itemList(context, inteiro[index]);
        });
  }

  _itemList(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.all(1),
      child: ListTile(
        title: Text(index.toString()),
        onTap: () {
          _dialog(context, index);
        },
        onLongPress: () {

        },
      ),
    );
  }

  _dialog(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Alerta Dialogo: ${index}"),
            titlePadding: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15),
                side: BorderSide(color: Colors.amber)),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Não",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text(
                  "Sim",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  _bottomNavigationBar() {
    return null;
  }
}
