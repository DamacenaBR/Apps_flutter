import 'package:app_quiz/model/Usuario.dart';
import 'package:app_quiz/telas/RouteGenerator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'AuthController.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @observable
  String email = "";

  @observable
  bool isCarregando = false;

  @observable
  String senha = "";

  @observable
  String mensagemErro = "";

  @action
  changeEmail(String value) => email = value;

  @action
  changeIsCarregando(bool value) => isCarregando = value;

  @action
  changeMensagemErro(String value) => mensagemErro = value;

  @action
  changeSenha(String value) => senha = value;

  Future<void> signInWithEmailAndPassword(Usuario usuario, BuildContext context) async {
    changeIsCarregando(true);
    await _firebaseAuth
        .signInWithEmailAndPassword(
      email: usuario.email,
      password: usuario.senha,
    ).then((value) {
      mensagemErro = "";
      Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_HOME);
    }).catchError((error) {
      if (error.code == 'user-not-found') {
        changeMensagemErro("Nenhum usuário encontrado para esse e-mail");
        changeIsCarregando(false);
      } else if (error.code == 'wrong-password') {
        changeMensagemErro("Senha errada fornecida para esse usuário");
        changeIsCarregando(false);
      }
      else{
        changeMensagemErro("Ops: Não foi possivel se acessar o aplicativo");
        changeIsCarregando(false);
      }
    });
  }

  Future<void> createUserWithEmailAndPassword(Usuario usuario) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: usuario.email,
      password: usuario.senha,
    ).then((_) {
      sendVerificationEmail();
    }).catchError((error) {
      if (error.code == 'weak-password') {
        changeMensagemErro("A senha fornecida é muito fraca");
        changeIsCarregando(false);
      } else if (error.code == 'email-already-in-use') {
        changeMensagemErro("A conta já existe para esse e-mail");
        changeIsCarregando(false);
      }
      else{
        changeMensagemErro("Ops: Não foi possivel se criar a conta");
        changeIsCarregando(false);
      }
    });
  }

  Future<void> sendVerificationEmail() async {
    User firebaseUser = FirebaseAuth.instance.currentUser;
    await firebaseUser.sendEmailVerification()
        .then((_) {
      changeMensagemErro("Cadastro realizado com sucesso!\nVerifique seu email para confirmação!");
      changeIsCarregando(false);
    }).catchError((error) {
      changeMensagemErro("Ops: E-mail não existe!");
      changeIsCarregando(false);
    });
  }

  Future<void> sendPasswordResetEmail(Usuario usuario) async {
    await _firebaseAuth.sendPasswordResetEmail(email: usuario.email)
        .then((_) {
      changeMensagemErro("E-mail para recuperar a senha foi enviado!");
      changeIsCarregando(false);
    }).catchError((error) {
      changeMensagemErro("Ops: Não foi possivel recuperar a senha!");
    });
  }

}
