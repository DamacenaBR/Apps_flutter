import 'package:app_quiz/controller/AuthController.dart';
import 'package:app_quiz/model/Usuario.dart';
import 'package:app_quiz/telas/RouteGenerator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail =
      TextEditingController(text: "bruno@gmail.com");
  TextEditingController _controllerSenha =
      TextEditingController(text: "1234567");

  final authController = AuthController();

  _validarCampos() async {
    //Recupera dados dos campos
    String email = _controllerEmail.text.trim();
    String senha = _controllerSenha.text.trim();

    if (email.isNotEmpty && email.contains("@") && email.contains(".com")) {
      if (senha.isNotEmpty && senha.length > 6) {
        Usuario usuario = Usuario();
        usuario.email = email;
        usuario.senha = senha;

        authController.signInWithEmailAndPassword(usuario, context);
      } else {
        authController.changeMensagemErro("Tamanho da senha menor que 6!");
      }
    } else {
      authController.changeMensagemErro(
          "Preencha o E-mail coretamente ex: xxxx@gmai.com");
    }
  }

  _verificaUsuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    //auth.signOut();

    User usuarioLogado = await auth.currentUser;
    if (usuarioLogado != null) {
      Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_HOME);
    }
  }

  @override
  void initState() {
    _verificaUsuarioLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
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
                                "Entrar",
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
              Center(
                child: GestureDetector(
                  child: Text(
                    "Não tenho conta? cadastre-se",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, RouteGenerator.ROTA_CADASTRO);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Center(
                  child: GestureDetector(
                    child: Text(
                      "Esqueceu a senha?",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteGenerator.ROTA_RECUPERAR_SENHA);
                    },
                  ),
                ),
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
