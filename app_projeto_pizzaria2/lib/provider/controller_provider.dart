import 'package:app_projeto_pizzaria2/model/pedido.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IncrementeProvider extends ChangeNotifier {
  List<Pedido> listPedido = List<Pedido>();

  Future<List<Pedido>> recuperarPedidosBD(String valor) async {
    Firestore db = Firestore.instance;
    QuerySnapshot querySnapshot = await db.collection(valor).orderBy("status", descending: false).getDocuments();

    List<Pedido> listaPedidos = List<Pedido>();
    for (DocumentSnapshot item in querySnapshot.documents) {
      var dados = item.data;
      Pedido p = Pedido(dados["nome"], dados["tamanho"], dados["descricao"], dados["valor"],
          item.documentID, dados["pizza"], dados["status"]);

      if (p.pizza == true) {
        listaPedidos.add(p);
      }
    }
    notifyListeners();
    return listaPedidos;
  }

  void atualizarPedidosBD(String mesa, String id, Pedido pedido) async {
    Firestore db = Firestore.instance;
    db.collection(mesa).document(id).setData({
      "nome": pedido.nome,
      "tamanho": pedido.tamanho,
      "descricao": pedido.descricao,
      "valor": pedido.valor,
      "pizza": pedido.pizza,
      "status" : "pronto"
    });
    notifyListeners();
  }
}
