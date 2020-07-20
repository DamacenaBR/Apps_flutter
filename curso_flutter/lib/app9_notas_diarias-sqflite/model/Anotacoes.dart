import 'package:curso_flutter/app9_notas_diarias-sqflite/controller/Helper.dart';

class Anotacoes {
  int id;
  String titulo;
  String descricao;
  String data;

  Anotacoes({this.titulo, this.descricao, this.data});

  Anotacoes.fromJson(Map<String, dynamic> json) {

    id = json[DBHelper.tabelaID];
    titulo = json['titulo'];
    descricao = json['descricao'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data[DBHelper.tabelaID] = this.id;
    }
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['data'] = this.data;
    return data;
  }
}
