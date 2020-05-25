import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('GridButton'),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context){
    return Container(
          padding: EdgeInsets.all(18.0),
          child: GridButton(
            textStyle: TextStyle(fontSize: 24),
            borderColor: Colors.grey[300],
            borderWidth: 2,
            onPressed: (dynamic val) {
              _dialog(context, val);
            },
            items: [
              [
                GridButtonItem(
                    title: "Black",
                    color: Colors.black,
                    textStyle: TextStyle(color: Colors.white, fontSize: 24)),
                GridButtonItem(title: "Red", color: Colors.red),
                GridButtonItem(title: "Yellow", color: Colors.yellow),
              ],
              [
                GridButtonItem(
                    title: "Button",
                    value: 100,
                    color: Colors.blue,
                    borderRadius: 30)
              ],
              [
                GridButtonItem(title: "7"),
                GridButtonItem(title: "8"),
                GridButtonItem(title: "9"),
                GridButtonItem(title: "×", color: Colors.grey[300]),
              ],
              [
                GridButtonItem(title: "4"),
                GridButtonItem(title: "5"),
                GridButtonItem(title: "6"),
                GridButtonItem(title: "-", color: Colors.grey[300]),
              ],
              [
                GridButtonItem(title: "1"),
                GridButtonItem(title: "2"),
                GridButtonItem(title: "3"),
                GridButtonItem(title: "+", color: Colors.grey[300]),
              ],
              [
                GridButtonItem(title: "0"),
                GridButtonItem(title: "000", flex: 2),
                GridButtonItem(title: "=", color: Colors.grey[300]),
              ],
            ],
          ),
        );
  }





  _dialog(BuildContext context, dynamic val) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text("${val.toString()}"),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15)),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Sair!",
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

  
}
