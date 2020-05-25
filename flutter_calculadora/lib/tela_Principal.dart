import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  TextEditingController _gasolina = TextEditingController();
  TextEditingController _etanol = TextEditingController();
  String resultado = "";
  double economia = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calculadora entre Gasolina ou Atanol"),
        backgroundColor: Colors.blue,
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _etanol,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço do Etanol",
                border: OutlineInputBorder(),
              ),
            ),
            Divider(
              color: Colors.indigo,
            ),
            TextField(
              controller: _gasolina,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço da Gasolina",
                border: OutlineInputBorder(),
              ),
            ),
            Divider(color: Colors.indigo),
            RaisedButton(
              child: Text("Calcular Combustível"),
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  double gasolina = double.parse(_gasolina.text);
                  double etanol = double.parse(_etanol.text);
                  economia = (etanol / gasolina);

                  if (economia < 0.73) {
                    resultado = "Álcool";
                  } else {
                    resultado = "Gasolina";
                  }
                });
              },
            ),
            Divider(color: Colors.indigo),
            Text(
              "Resultado: (%): ${economia.toStringAsPrecision(2)}",
              style: TextStyle(fontSize: 20),
            ),
            Divider(color: Colors.indigo),
            Text("Em geral o melhor resultado é: ${resultado}",
                style: TextStyle(fontSize: 20)),
            Divider(color: Colors.indigo),
            Text(
              "(Na média, uma relação de 73% ou menos do preço do etanol em relação da gasolina, favorece o uso do álcool. Se for 74% ou nais, use gasolina.)",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
