import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _valueComidaBrasileira = false;
  bool _valueComidaMexicana = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blue,
      title: Text("CheckBox"),
    );
  }

  _body() {
    return Container(
      child: Column(
        children: <Widget>[
          /*Text("Comida Brasileira"),
          Checkbox(value: _valueCheckBox, onChanged: (bool value) {
            setState(() {
              _valueCheckBox = value;
            });
          }),
          */
          CheckboxListTile(
              title: Text("Comida Brasileira"),
              subtitle: Text("A melhor comida do mundo!"),
              value: _valueComidaBrasileira,
              selected: _valueComidaBrasileira,
              activeColor: Colors.red,
              secondary: Icon(Icons.add_box),
              onChanged: (bool valor) {
                setState(() {
                  _valueComidaBrasileira = valor;
                });
              }),
          CheckboxListTile(
              title: Text("Comida Mexicana"),
              subtitle: Text("A melhor comida do mundo!"),
              value: _valueComidaMexicana,
              selected: _valueComidaMexicana,
              activeColor: Colors.red,
              secondary: Icon(Icons.add_box),
              onChanged: (bool valor) {
                setState(() {
                  _valueComidaMexicana = valor;
                });
              }),

          RaisedButton(
              child: Text(
                "Salvar",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                print(
                    "Comida Brasileira: " + _valueComidaBrasileira.toString());
                print("Comida Mexicana: " + _valueComidaMexicana.toString());
              }),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                Text("Comida Brasileira: " + _valueComidaBrasileira.toString()),
                Text("Comida Mexicana: " + _valueComidaMexicana.toString()),
              ],
            ),
          )

          //_checkBox("Comida Brasileira", "A melhor comida do mundo!", _valueComidaBrasileira, _valueComidaBrasileira),
          //_checkBox("Comida Mexicana", "A melhor comida do mundo!", _valueComidaMexicana, _valueComidaMexicana)
        ],
      ),
    );
  }

  /*_checkBox(String titulo, String subtitulo, bool valueCheckBox, bool selecionadoTexto) {
    return CheckboxListTile(
        title: Text(titulo),
        subtitle: Text(subtitulo),
        value: valueCheckBox,
        selected: selecionadoTexto,
        activeColor: Colors.red,
        secondary: Icon(Icons.add_box),
        onChanged: (bool valor) {
          setState(() {
            valueCheckBox = valor;
          });
        });
  }*/

  _bottomNavigationBar() {
    return null;
  }
}
