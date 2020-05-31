import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double _valorSlider = 0;
  String _label = "Valor selecionado";
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
      title: Text("Slider"),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(60),
      child: Column(
        children: <Widget>[

          Slider(
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
            divisions: 20,
            value: _valorSlider,
            label: _label,
            min: 0,
            max: 10,
            onChanged: (double novoValor){
              setState(() {
                _valorSlider = novoValor;
                _label = "Valor selecionado " + novoValor.toString();
              });
            }
          ),
          RaisedButton(
            child: Text(
              "Salvar",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            color: Colors.lightBlue,
            onPressed: () {
              print("valor selecionado " + _valorSlider.toString());
            }),
          
        ],
      ),
    );
  }

  _bottomNavigationBar() {
    return null;
  }
}
