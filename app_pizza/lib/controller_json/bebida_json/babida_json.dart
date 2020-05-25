import 'package:app_pizza/model/bebidas.dart';

class BebidaJson {
  String categoria;
  List<Bebida> bebidas;

  BebidaJson({this.categoria, this.bebidas});

  BebidaJson.fromJson(Map<dynamic, dynamic> json) {
    categoria = json['categoria'];

    var list = json['bebidas'] as List;
    List<Bebida> bebidasList = list.map((i) => Bebida.fromJson(i)).toList();

    bebidas = bebidasList;
  }

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> json = Map<dynamic, dynamic>();
    json['categoria'] = categoria;
    json['bebidas'] = bebidas;

    return json;
  }

  @override
  String toString() {
    return "Nome: $categoria => Bebidas: $bebidas";
  }
}
