import 'package:app_chat/telas/Cadastro.dart';
import 'package:app_chat/telas/Configuracoes.dart';
import 'package:app_chat/telas/Home.dart';
import 'package:app_chat/telas/Login.dart';
import 'package:app_chat/telas/mensagens.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String ROTA_HOME = "/login";
  static const String ROTA_LOGIN = "/home";
  static const String ROTA_CADASTRO = "/cadastro";
  static const String ROTA_CONFIGURACOES = "/configuracoes";
  static const String ROTA_MENSAGENS = "/mensagens";

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
      case ROTA_CONFIGURACOES:
        return MaterialPageRoute(builder: (_) => Configuracoes());
      case ROTA_MENSAGENS:
        return MaterialPageRoute(builder: (_) => Mensagens(argumentos));
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
