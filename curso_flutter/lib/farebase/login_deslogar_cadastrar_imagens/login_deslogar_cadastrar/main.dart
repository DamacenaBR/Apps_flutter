import 'package:app_chat/teste/login_deslogar_cadastrar/Home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseAuth auth = FirebaseAuth.instance;

  String email = "bruno@gmail.com";
  String senha = "123456";

  /*
  //cadastrando usuario

  auth
      .createUserWithEmailAndPassword(email: email, password: senha)
      .then((firebaseUser) {
    print("Novo usuario: sucesso!:" + firebaseUser.user.email);
  }).catchError((erro) {
    print("Novo usuario: erro " + erro.toString());
  });
  */

  /*
  //Teste usuario logado

  FirebaseUser usuarioAtual = await auth.currentUser();
  if (usuarioAtual != null) {
    print("Usuario logado " + usuarioAtual.email);
  } else {
    print("Delogado!");
  }
  */

  //deslogando usuario
  //auth.signOut();

  //logar usuario

  auth
      .signInWithEmailAndPassword(email: email, password: senha)
      .then((firebaseUser) {
    print("usuario logado com sucesso!:" + firebaseUser.user.email);
  }).catchError((erro) {
    print("Usuario: erro " + erro.toString());
  });

  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
