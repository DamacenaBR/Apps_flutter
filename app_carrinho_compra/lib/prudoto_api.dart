import 'dart:convert';
import 'package:app_carrinho_compra/produto.dart';
import 'package:flutter/services.dart';

class ProdutoApi {
  static Future<List<Produto>> getProdutos() async {
    String dados = await rootBundle.loadString("assets/jsons/produto.json");

    List lista = json.decode(dados);

    List<Produto> listaProdutos = List<Produto>();

    for (Map map in lista) {
      Produto produto = Produto.fromJson(map);
      listaProdutos.add(produto);
    }
    return listaProdutos;
  }
}