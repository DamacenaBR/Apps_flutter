import 'package:flutter_imc/shared_preferences.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _peso = new TextEditingController();
  TextEditingController _altura = new TextEditingController();
  TextEditingController _resultado = new TextEditingController();

  String resultado = "Resultado";

  @override
  void initState() {
    super.initState();
    _pegaDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Center(
        child: Container(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "IMC",
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            Divider(),
            TextField(
              controller: _peso,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Peso"),
              keyboardType: TextInputType.number,
            ),
            Divider(),
            TextField(
              controller: _altura,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Altura"),
              keyboardType: TextInputType.number,
            ),
            Divider(),
            RaisedButton(
              child: Text("Calcular"),
              onPressed: () {
                _calcularImc();
                _armazenarDados();
              },
            ),
            Divider(),
            Text(
              "${resultado}",
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    ));
  }

  void _armazenarDados() {
    String peso = _peso.text;
    String altura = _altura.text;
    String resultadoController = _resultado.text;

    SharedPreferencesApi.setValor("peso", peso);
    SharedPreferencesApi.setValor("altura", altura);
    SharedPreferencesApi.setValor("resultado", resultadoController);
  }

  void _pegaDados() async {
    _peso.text = await SharedPreferencesApi.getValor("peso");
    _altura.text = await SharedPreferencesApi.getValor("altura");
    _resultado.text = await SharedPreferencesApi.getValor("resultado");
  }

  void _calcularImc() {
    double altura = double.parse(_altura.text);
    double peso = double.parse(_peso.text);
    double imc = peso / (altura * altura);

    setState(() {
      if (imc < 18.5) {
        resultado = "Abaixo do peso.";
      } else if (imc >= 18.5 && imc <= 24.9) {
        resultado = "Peso normal";
      } else if (imc >= 25 && imc <= 29.9) {
        resultado = "Sobrepeso";
      } else if (imc >= 30 && imc <= 34.9) {
        resultado = "Obesidade grau 1";
      } else if (imc >= 35 && imc < 39.9) {
        resultado = "Obesidade grau 2";
      } else if (imc >= 40) {
        resultado = "Obesidade grau 3";
      }

      _resultado.text = resultado;
    });
  }
}
