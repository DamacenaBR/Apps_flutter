import 'package:app_chat/model/Usuario.dart';
import 'package:app_chat/telas/RouteGenerator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController _controllerNome =
      TextEditingController(text: "Bruno Damacena");
  TextEditingController _controllerEmail =
      TextEditingController(text: "bruno25@gmail.com");
  TextEditingController _controllerSenha =
      TextEditingController(text: "1234567");
  String _mensagemErro = "";

  _validarCampos() {
    //Recupera dados dos campos
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if (nome.isNotEmpty) {
      if (email.isNotEmpty && email.contains("@")) {
        if (senha.isNotEmpty && senha.length > 6) {
          setState(() {
            _mensagemErro = "";
          });

          Usuario usuario = Usuario();
          usuario.nome = nome;
          usuario.email = email;
          usuario.senha = senha;

          _cadastrarUsuario(usuario);
        } else {
          setState(() {
            _mensagemErro = "Preencha a senha! digite mais de 6 caracteres";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Preencha o E-mail utilizando @";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o Nome";
      });
    }
  }

  _validarCampos2() {
    //Recupera dados dos campos

    String email = _controllerEmail.text;

    if (email.isNotEmpty && email.contains("@gmail.com")) {
      setState(() {
        _mensagemErro = "";
      });

      Usuario usuario = Usuario();
      usuario.email = email;

      _teste(usuario);
    } else {
      setState(() {
        _mensagemErro = "Preencha  email! xxxxx@gmail.com.br";
      });
    }
  }

  _teste(Usuario usuario) async {
    FirebaseAuth auth = await FirebaseAuth.instance
        .sendPasswordResetEmail(email: usuario.email);
  }

  _cadastrarUsuario(Usuario usuario) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      final result = await auth.createUserWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha,
      );
      if (result != null) {
        //salvar dados usuarios
        Firestore db = Firestore.instance;
        FirebaseUser user = await auth.currentUser();
        db.collection("usuarios").document(user.uid).setData(
              usuario.toMap(),
            );

        Navigator.pushNamedAndRemoveUntil(
            context, RouteGenerator.ROTA_HOME, (_) => false);
      }
    } on PlatformException catch (e) {
      setState(() {
        _mensagemErro =
            "Erro ao cadastrar usuário, verifique os campos e tente novamente!";
      });
    }
  }

  /*
    auth
        .createUserWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser) {
      //salvar dados usuarios
      Firestore db = Firestore.instance;
      db.collection("usuarios").document(firebaseUser.uid).setData(
            usuario.toMap(),
          );

      Navigator.pushReplacementNamed(context, "/home");
    }).catchError((error) {
      print("erro app: " + error.toString());
      setState(() {
        _mensagemErro =
            "Erro ao cadastrar usuário, verifique os campos e tente novamente!";
      });
    });
  }
  */
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
                child: TextField(
                  controller: _controllerEmail,
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
                child: RaisedButton(
                    child: Text(
                      "Cadastrar",
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
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: _controllerEmail,
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
                child: RaisedButton(
                    child: Text(
                      "recuperar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.green,
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      _validarCampos2();
                    }),
              ),
              Center(
                child: Text(
                  _mensagemErro,
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
