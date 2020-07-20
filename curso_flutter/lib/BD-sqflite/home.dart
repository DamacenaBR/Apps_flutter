import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final String _nomeDB = "banco.db";
  static final int _versaoDB = 1;

  _recuperarbancoDados() async {
    final caminho = await getDatabasesPath();
    final localBancoDados = join(caminho, _nomeDB);
    var bd = await openDatabase(localBancoDados, //local
        version: _versaoDB, //versão
        onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE usuarios(id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";
      db.execute(sql);
    });
    return bd;
  }

  _salvar() async {
    Database bd = await _recuperarbancoDados();
    Map<String, dynamic> dadosUsuarios = {
      "nome": "Carlos silvério",
      "idade": 25
    };

    int id = await bd.insert("usuarios", dadosUsuarios);
    print("Salvo: " + id.toString());
  }

  _atualizar(int id) async {
    Database bd = await _recuperarbancoDados();
    Map<String, dynamic> dadosUsuarios2 = {
      "nome": "Bruno",
      "idade": 24
    };
    int retorno = await bd.update(
      "usuarios",
      dadosUsuarios2,
      where: "id = ?",
      whereArgs: [id]
    );

    print("Atualizado: " + retorno.toString());
  }

  _deletar(int id) async {
    Database bd = await _recuperarbancoDados();
    int retorno = await bd.delete(
      "usuarios",
      where: "id = ?",
      whereArgs: [id]
    );

    print("item qtde removida:" + retorno.toString());
  }

  _listarUsuarios() async {
    Database bd = await _recuperarbancoDados();
    //String sql = "SELECT * FROM usuarios";
    //String sql = "SELECT * FROM usuarios WHERE idade BETWEEN 20 AND 50"; // idade entre 20 e 50
    //String sql = "SELECT * FROM usuarios WHERE idade IN (18,25)"; //onde a idade é 18 e 25
    //String sql = "SELECT * FROM usuarios WHERE nome LIKE 'Ana%'"; //traz Ana%  %= depois pode ser qualquer coisa
    String filtro = "a";
    //String sql = "SELECT * FROM usuarios WHERE nome LIKE '%${filtro}%'"; //traz  %_% = antes ou depois pode ser qualquer coisa
    String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY UPPER(nome) ASC"; //acesdente UPPER = transforma o nomes miusculo
    //String sql =
        "SELECT * FROM usuarios WHERE 1=1 ORDER BY UPPER(nome) DESC"; //descendente UPPER = transforma o nomes miusculo
    List usuarios = await bd.rawQuery(sql);

    for (var usuario in usuarios) {
      print("item id:" +
          usuario["id"].toString() +
          ", nome:" +
          usuario["nome"] +
          ", idade:" +
          usuario["idade"].toString());
    }
    //print("Usuarios:" + usuarios.toString());
  }

  _recuperarUsuarioID(int id) async {
    Database bd = await _recuperarbancoDados();
    List usuarios = await bd.query("usuarios",
        columns: ["id", "nome", "idade"],
        where: "id = ?",
        //where: "id = ? AND nome = ?",
        whereArgs: [id]
        //whereArgs: [id,"Bruno"]
        );
    for (var usuario in usuarios) {
      print("item id:" +
          usuario["id"].toString() +
          ", nome:" +
          usuario["nome"] +
          ", idade:" +
          usuario["idade"].toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    //_recuperarbancoDados();
    //_salvar();
    _listarUsuarios();
    //_recuperarUsuarioID(3);
    //_deletar(2);
    //_atualizar(3);
    return Container();
  }
}
