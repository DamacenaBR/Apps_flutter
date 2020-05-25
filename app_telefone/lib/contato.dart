import 'package:app_telefone/telefone.dart';

class Contato {
  String categoria;
  List<Telefone> telefones;

  Contato({this.categoria, this.telefones});

  Contato.fromJson(Map<dynamic, dynamic> json) {
    categoria = json['categoria'];

    var list = json['telefones'] as List;
    List<Telefone> telefonesList =
        list.map((i) => Telefone.fromJson(i)).toList();

    telefones = telefonesList;
  }

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> json = Map<dynamic, dynamic>();
    json['categoria'] = categoria;
    json['telefones'] = telefones;

    return json;
  }

  @override
  String toString() {
    return "Nome: $categoria => Número: $telefones";
  }
}
