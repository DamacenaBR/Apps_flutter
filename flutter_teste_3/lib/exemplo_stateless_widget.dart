import 'package:flutter/material.dart';

class ExemploStateLessWidget extends StatelessWidget {
  double valor = 0;

  void acrescentar() {
    valor += 100.0;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('R\$ $valor',
            style: TextStyle(
              fontSize: 25,
              color: Colors.blue,
            )),
        RaisedButton(
          child: Text('R\$ 100.0'),
          onPressed: () {
            acrescentar();
          },
        )
      ],
    ));
  }
}
