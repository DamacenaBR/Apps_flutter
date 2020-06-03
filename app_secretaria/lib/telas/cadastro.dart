import 'package:app_secretaria/model/validador.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerCpf = TextEditingController();
  //TextEditingController _controllerRg = TextEditingController();
  _cadastrarUsuario() {}

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
      title: Text("Prontuário SUAS"),
      backgroundColor: Colors.lightBlue,
    );
  }

  _body() {
    return Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
              child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: _textFormFild(_controllerNome, TextInputType.text,
                      "Nome", "Nome Correto", validarNome),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: _textFormFild(_controllerCpf, TextInputType.number,
                      "CPF", 'CPF Correto', validarCpf),
                ),
                /*Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: _textFormFild(_controllerRg, TextInputType.number,
                      "RG", 'RG Correto', validarRg),
                ),*/
                _textFormFild(_controllerEmail, TextInputType.emailAddress,
                    "Email", 'Email Correto', validarEmail),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.lightBlue,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          print(_controllerNome.text);
                        }
                      }),
                ),
              ],
            ),
          )),
        ));
  }

  _textFormFild(TextEditingController controller, TextInputType keyboardType,
      String hintText, String helperText, dynamic validador) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
          hintText: hintText,
          helperText: helperText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
      validator: (value) {
        return validador(value);
      },
    );
  }

  _bottomNavigationBar() {
    return null;
  }
}
