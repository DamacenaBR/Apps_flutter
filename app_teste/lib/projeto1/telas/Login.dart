import 'package:app_teste/projeto1/model/Usuario.dart';
import 'package:app_teste/projeto1/telas/RouteGenerator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail =
      TextEditingController(text: "bruno@gmail.com");
  TextEditingController _controllerSenha =
      TextEditingController(text: "1234567");
  String _mensagemErro = "";

  bool _carregando = false;

  _validarCampos() {
    //Recupera dados dos campos
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if (email.isNotEmpty && email.contains("@") && email.contains(".com")) {
      if (senha.isNotEmpty) {
        setState(() {
          _mensagemErro = "";
        });

        Usuario usuario = Usuario();
        usuario.email = email;
        usuario.senha = senha;

        _logarUsuario(usuario);
      } else {
        setState(() {
          _mensagemErro = "Preencha a senha!";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o E-mail coretamente!";
      });
    }
  }

  _logarUsuario(Usuario usuario) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    setState(() {
      _carregando = true;
    });

    await auth
        .signInWithEmailAndPassword(
          email: usuario.email,
          password: usuario.senha,
        )
        .then((value) => {
              setState(() {
                _carregando = false;
              }),
              Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_HOME),
            })
        .catchError((error) {
      setState(() {
        _carregando = false;
        _mensagemErro =
            "Erro ao autenticar usuário, verifique os campos e tente novamente!";
      });
    });
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
              TextField(
                controller: _controllerSenha,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 20),
                obscureText: true,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "Senha",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 10),
                child: _carregando
                    ? Center(child: CircularProgressIndicator())
                    : RaisedButton(
                        child: Text(
                          "Entrar",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.green,
                        padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        onPressed: () {
                          _validarCampos();
                        }),
              ),
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
                child: Center(
                  child: Text(
                    _mensagemErro,
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
