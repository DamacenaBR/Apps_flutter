import 'package:app_quiz/controller/AuthController.dart';
import 'package:app_quiz/model/Usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RecuperSenha extends StatefulWidget {
  @override
  _RecuperSenhaState createState() => _RecuperSenhaState();
}

class _RecuperSenhaState extends State<RecuperSenha> {
  TextEditingController _controllerEmail =
      TextEditingController(text: "bruno@gmail.com");

  final authController = AuthController();

  _validarCampos() {
    //Recupera dados dos campos
    String email = _controllerEmail.text.trim();

    if (email.isNotEmpty && email.contains("@") && email.contains(".com")) {
      Usuario usuario = Usuario();
      usuario.email = email;

      authController.sendPasswordResetEmail(usuario);
    } else {
      authController.changeMensagemErro(
          "Preencha o E-mail coretamente\nex: xxxx@gmai.com");
    }
  }

  @override
  void initState() {
    super.initState();
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
      title: Text("Recuperar Senha"),
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
                padding: EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: _controllerEmail,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "E-mail",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 10),
                child: Observer(builder: (_) {
                  return authController.isCarregando
                      ? Center(child: CircularProgressIndicator())
                      : RaisedButton(
                      child: Text(
                        "Recuperar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.green,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      onPressed: () {
                        _validarCampos();
                      });
                }),
              ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
