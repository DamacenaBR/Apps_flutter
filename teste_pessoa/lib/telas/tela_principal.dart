

import 'package:flutter/material.dart';
import 'package:teste_pessoa/banco_de_dados.dart';
import 'package:teste_pessoa/bd.dart';
import 'package:teste_pessoa/wigget_page.dart';



class TelaPrincipal extends StatelessWidget {
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  BancoDeDados bd = BancoDeDados();
  TelaWidget tl = TelaWidget();

  String _nome;
  String _idade;
  String _email;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Teste",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: _body(),
    );
  }

  _body(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _keyForm,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Nome", border: OutlineInputBorder()),
                    onSaved: (nome) {
                      _nome = nome;
                    },
                  ),
                  Divider(),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "idade", border: OutlineInputBorder()),
                    onSaved: (idade) {
                      _idade = idade;
                    },
                  ),
                  Divider(),                  
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email", border: OutlineInputBorder()),
                    onSaved: (email) {
                      _email = email;
                    },
                  ),
                  Divider(),
                  RaisedButton(
                    child: Text("Validar"),
                    onPressed: () async {
                      _keyForm.currentState.save();                     
                      var conn = await iniciaConexao();
                      await bd.inserirDados(conn);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      
    );
  }

  
}