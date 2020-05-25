import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';

class ExemplosAlertas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  _body() {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Dialog"),
                onPressed: () {
                  _dialog(context);
                },
              ),
              RaisedButton(
                child: Text("Toats"),
                onPressed: () {
                  _toats();
                },
              ),
              RaisedButton(
                child: Text("SnackBAr"),
                onPressed: () {
                  _snackBar(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  _toats() {
    Fluttertoast.showToast(
        msg: "Esta é um Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _snackBar(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        "Salvando...",
        style: TextStyle(fontSize: 20),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 5),
    ));
  }

  _dialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Deletar"),
            content: Text("Deletar esse item?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Sim"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("Não"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
