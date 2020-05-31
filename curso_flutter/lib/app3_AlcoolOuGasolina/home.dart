import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);
    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número invalido, Digite numeros maiores que 0 e utilizando (.)";
      });
    } else {
      if ((precoAlcool / precoGasolina) > 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com alcool";
        });
      }
      _limparCampos();
    }
  }

  void _limparCampos() {
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

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
      title: Text("Álcool ou Gasolina"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  _body() {
    return Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Image.asset("assets/imagens/logo1.png"),
              ),
              Text(
                "Saiba qual a melhor opção para abastecimento do seu carro",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              _textField(TextInputType.number, "Preço Alcool, ex: 1.59",
                  _controllerAlcool),
              _textField(TextInputType.number, "Preço Gasolina, ex: 3.59",
                  _controllerGasolina),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Colors.blue,
                  onPressed: () => _calcular(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }

  _textField(TextInputType textInputType, String labelText,
      TextEditingController textController) {
    return TextField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      style: TextStyle(
        fontSize: 20,
      ),
      controller: textController,
    );
  }

  _bottomNavigationBar() {
    return null;
  }
}
