import 'package:app_quiz/controller/AuthController.dart';
import 'package:app_quiz/model/Usuario.dart';
import 'package:app_quiz/telas/RouteGenerator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController _controllerNome =
      TextEditingController(text: "Bruno Damacena");
  TextEditingController _controllerEmail =
      TextEditingController(text: "bruno30@gmail.com");
  TextEditingController _controllerSenha =
      TextEditingController(text: "1234567");

  final authController = AuthController();

  _validarCampos() {
    String nome = _controllerNome.text.trim();
    String email = _controllerEmail.text.trim();
    String senha = _controllerSenha.text.trim();

    if (nome.isNotEmpty && nome.length > 4) {
      if (email.isNotEmpty && email.contains("@") && email.contains(".com")) {
        if (senha.isNotEmpty && senha.length > 6) {
          Usuario usuario = Usuario();
          usuario.email = email;
          usuario.senha = senha;

          authController.createUserWithEmailAndPassword(usuario);
          _controllerSenha.clear();
          _controllerEmail.clear();
          _controllerNome.clear();
        } else {
          authController.changeMensagemErro("Tamanho da senha menor que 6!");
        }
      } else {
        authController.changeMensagemErro(
            "Preencha o E-mail coretamente\nex: xxxx@gmai.com");
      }
    } else {
      authController.changeMensagemErro("Preencha o Nome");
    }
  }

  _textFild(
      {TextEditingController controller,
      TextInputType inputType,
      String nome,
      bool obscureText,
      bool autofocus}) {
    return TextField(
      controller: controller,
      autofocus: autofocus,
      obscureText: obscureText,
      keyboardType: inputType,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
          hintText: nome,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text("Cadastro"),
    );
  }

  _body() {
    return Container(
      decoration: BoxDecoration(color: Color(0xff075e54)),
      padding: EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset(
                  "assets/imagens/usuario.png",
                  width: 200,
                  height: 150,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: _controllerNome,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Nome",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: _textFild(
                    controller: _controllerEmail,
                    inputType: TextInputType.emailAddress,
                    nome: "E-mail",
                    autofocus: true,
                    obscureText: false),
              ),
              _textFild(
                  controller: _controllerSenha,
                  inputType: TextInputType.text,
                  nome: "Senha",
                  autofocus: false,
                  obscureText: true),
              Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: Observer(
                    builder: (_) {
                      return authController.isCarregando
                          ? Center(child: CircularProgressIndicator())
                          : RaisedButton(
                              child: Text(
                                "Cadastrar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              color: Colors.green,
                              padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              onPressed: () {
                                _validarCampos();
                              });
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Center(child: Observer(
                  builder: (_) {
                    return Text(
                      authController.mensagemErro,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
