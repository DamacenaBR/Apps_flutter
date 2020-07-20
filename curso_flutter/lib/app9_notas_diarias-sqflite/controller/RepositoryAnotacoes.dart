import 'package:curso_flutter/app9_notas_diarias-sqflite/controller/Helper.dart';
import 'package:curso_flutter/app9_notas_diarias-sqflite/model/Anotacoes.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';

class RepositoryAnotacoes {
  Future<int> inserirAnotacao(Anotacoes anotacao) async {
    Database db = await DBHelper.instance.database;

    int resultado =
        await db.insert(DBHelper.nomeTabela, anotacao.toJson());
    return resultado;
  }

  recuperarAnotacoes() async {
    Database db = await DBHelper.instance.database;
    String sql = "SELECT * FROM ${DBHelper.nomeTabela} ORDER BY ${DBHelper.tabelaData} DESC";
    List anotacoes = await db.rawQuery(sql);
    return anotacoes;
  }

  Future<int> atualizarAnotacao(Anotacoes anotacao) async{
    print("ID: ${anotacao.id}");
    Database db = await DBHelper.instance.database;
    int resultado = await db.update(
      DBHelper.nomeTabela,
      anotacao.toJson(),
      where: "id = ?",
      whereArgs: [anotacao.id],
    );
    return resultado;
  }

  Future<int> deletar(int id) async {
    Database bd = await DBHelper.instance.database;
    int retorno = await bd.delete(
      DBHelper.nomeTabela,
      where: "id = ?",
      whereArgs: [id],
    );
    return retorno;
  }
}
