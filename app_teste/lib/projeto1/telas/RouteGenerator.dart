import 'package:app_teste/projeto1/telas/Cadastro.dart';
import 'package:app_teste/projeto1/telas/Home.dart';
import 'package:app_teste/projeto1/telas/Login.dart';
import 'package:app_teste/projeto1/telas/tela_recuperarSenha.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String ROTA_HOME = "/login";
  static const String ROTA_LOGIN = "/home";
  static const String ROTA_CADASTRO = "/cadastro";
  static const String ROTA_CONFIGURACOES = "/configuracoes";
  static const String ROTA_MENSAGENS = "/mensagens";
  static const String ROTA_RECUPERAR_SENHA = "/recuperarSenha";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argumentos = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Login());
      case ROTA_LOGIN:
        return MaterialPageRoute(builder: (_) => Login());
      case ROTA_HOME:
        return MaterialPageRoute(builder: (_) => Home());
      case ROTA_CADASTRO:
        return MaterialPageRoute(builder: (_) => Cadastro());
      case ROTA_RECUPERAR_SENHA:
        return MaterialPageRoute(builder: (_) => RecuperSenha());
      default:
        return _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Tela não encontrada!"),
        ),
        body: Center(
          child: Text("Tela não encontrada!"),
        ),
      );
    });
  }
}
