import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {

  FirebaseAuth auth = FirebaseAuth.instance;

  /* Criando usuário com e-mail e senha */
  String email = "jamilton@gmail.com";
  String senha = "123456";

  /*
  auth.createUserWithEmailAndPassword(
      email: email,
      password: senha
  ).then((firebaseUser){
    print("novo usuario: sucesso!! e-mail: " + firebaseUser.email );
  }).catchError((erro){
    print("novo usuario: erro " + erro.toString() );
  });*/


  //auth.signOut();

  /* Logando usuário */
  /*
  auth.signInWithEmailAndPassword(
      email: email,
      password: senha
  ).then((firebaseUser){

    print("Logar usuario: sucesso!! e-mail: " + firebaseUser.email );
  }).catchError((erro){
    print("Logar usuario: erro " + erro.toString() );
  });*/

  auth.signOut();

  FirebaseUser usuarioAtual = await auth.currentUser();
  if( usuarioAtual != null ){//logado
    print("Usuario atual logado email: " + usuarioAtual.email );
  }else{//deslogado
    print("Usuario atual está DESLOGADO!!");
  }

  runApp(App());

}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
