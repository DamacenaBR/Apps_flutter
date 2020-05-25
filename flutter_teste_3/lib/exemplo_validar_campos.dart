import 'package:flutter/material.dart';
import 'exemplo_funcoes_validadoras.dart';

class ExemploTextFormField extends StatelessWidget {
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  String _nome;
  String _cpf;
  String _telefone;
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _keyForm,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _nomeController,
                    decoration: InputDecoration(
                        labelText: "Nome", border: OutlineInputBorder()),
                    validator: (nome) {
                      return validaNome(nome);
                    },
                    onSaved: (nome) {
                      _nome = nome;
                    },
                  ),
                  Divider(),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Cpf", border: OutlineInputBorder()),
                    validator: (cpf) {
                      return validaCpf(cpf);
                    },
                    onSaved: (cpf) {
                      _cpf = cpf;
                    },
                  ),
                  Divider(),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "Telefone", border: OutlineInputBorder()),
                    validator: (telefone) {
                      return validaTelefone(telefone);
                    },
                    onSaved: (telefone) {
                      _telefone = telefone;
                    },
                  ),
                  Divider(),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email", border: OutlineInputBorder()),
                    validator: (email) {
                      return validaEmail(email);
                    },
                    onSaved: (email) {
                      _email = email;
                    },
                  ),
                  Divider(),
                  RaisedButton(
                    child: Text("Validar"),
                    onPressed: () {
                      if (_keyForm.currentState.validate()) {
                        print("Foi validado.");
                        _keyForm.currentState.save();
                        print("Nome: $_nome");
                        print("Cpf: $_cpf");
                        print("Telefone: $_telefone");
                        print("Email: $_email");
                        print("Nome Controller: ${_nomeController.text}");
                      } else {
                        print("Não foi validado.");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
