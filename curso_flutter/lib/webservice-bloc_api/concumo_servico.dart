import 'dart:convert';
import 'package:curso_flutter/webservice-bloc_api/cep.dart';
import 'package:curso_flutter/webservice-bloc_api/controller_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Mybloc _bloc = Mybloc();
  //TextEditingController _controllerCep = TextEditingController();
  //String _resultado = "Resultado";

  /*_recuperarCep(String cep) async {
    String cepRecuperado = cep;
    String url = "https://viacep.com.br/ws/${cepRecuperado}/json/";

    http.Response response;

    response = await http.get(url);
    if (response.statusCode == 200) {
      Cep _cep = Cep.fromJson(json.decode(response.body));
      setState(() {
        _resultado = "CEP: ${_cep.cep}\nLocalidade: ${_cep.localidade}\nUF: ${_cep.uf}";
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    //Map<String,dynamic> retorno = json.decode(response.body);
  }*/

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
      title: Text("concumo serviço web"),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              _bloc.input.add(value);
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Digite o cep: ex: 58900000",
            ),
          ),
          StreamBuilder<Cep>(
            stream: _bloc.output,
            initialData: Cep(cep: " Digite o Cep"),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("Cep errado!");
              }
              Cep _cep = snapshot.data;
              return Text("CEP: ${_cep.localidade}");
            },
          )
        ],
      ),
    );
  }

  _bottomNavigationBar() {
    return null;
  }
}
