import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

class MenuPrincipal1 extends StatefulWidget {
  @override
  _MenuPrincipal1State createState() => _MenuPrincipal1State();
}

class _MenuPrincipal1State extends State<MenuPrincipal1> {
  String text = '';
  double resulParcial = 0;
  String operacao = '';
  double resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('GridButton'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              exit(0);
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(18.0),
      child: GridButton(
        textStyle: TextStyle(fontSize: 24),
        borderColor: Colors.grey[300],
        borderWidth: 2,
        onPressed: (dynamic val) {
          setState(() {
            _calculadora(val);
          });
        },
        items: [
          [
            GridButtonItem(
                title: "${text.toString()}",
                color: Colors.white,
                textStyle: TextStyle(color: Colors.black, fontSize: 24)),
          ],
          [
            GridButtonItem(title: "7"),
            GridButtonItem(title: "8"),
            GridButtonItem(title: "9"),
            GridButtonItem(title: "/", color: Colors.grey[300]),
          ],
          [
            GridButtonItem(title: "4"),
            GridButtonItem(title: "5"),
            GridButtonItem(title: "6"),
            GridButtonItem(title: "x", color: Colors.grey[300]),
          ],
          [
            GridButtonItem(title: "1"),
            GridButtonItem(title: "2"),
            GridButtonItem(title: "3"),
            GridButtonItem(title: "-", color: Colors.grey[300]),
          ],
          [
            GridButtonItem(title: "0", flex: 2),
            GridButtonItem(title: "."),           
            GridButtonItem(title: "+", color: Colors.grey[300]),
          ],
          [
            GridButtonItem(title: 'Limpar', color: Colors.grey[200], flex: 3),
            GridButtonItem(title: "=", color: Colors.grey[300]),
          ]
        ],
      ),
    );
  }

  _calculadora(dynamic val) {
    if (identical(val.toString(), 'Limpar')) {
      text = '';
      operacao = '';
      resulParcial = 0;
      resultado = 0;
    } else if (identical(val.toString(), '-')) {
      operacao = '-';
      resulParcial = double.parse(text.toString());
      text = '';
    } else if (identical(val.toString(), 'x')) {
      operacao = 'x';
      resulParcial = double.parse(text.toString());
      text = '';
    } else if (identical(val.toString(), '+')) {
      operacao = '+';
      resulParcial = double.parse(text.toString());
      text = '';
    } else if (identical(val.toString(), '/')) {
      operacao = '/';
      resulParcial = double.parse(text.toString());
      text = '';
    } else if (identical(val.toString(), '=')) {
      if (identical('x', operacao)) {
        resultado = resulParcial * double.parse(text.toString());
        text = resultado.toString();
        operacao = '';
      } else if (identical('-', operacao)) {
        resultado = resulParcial - double.parse(text.toString());
        text = resultado.toString();
        operacao = '';
      } else if (identical('+', operacao)) {
        resultado = resulParcial + double.parse(text.toString());
        text = resultado.toString();
        operacao = '';
      } else if (identical('/', operacao)) {
        resultado = resulParcial / double.parse(text.toString());
        text = resultado.toString();
        operacao = '';
      }
    } else {
      text += '${val.toString()}';
    }
  }
}
