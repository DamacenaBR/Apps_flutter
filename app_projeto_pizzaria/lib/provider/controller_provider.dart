import 'package:app_projeto_pizzaria/model/pedido.dart';
import 'package:app_projeto_pizzaria/model/pedido_finalizado.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class IncrementeProvider extends ChangeNotifier {
  List<Pedido> listPedido = List<Pedido>();

  void adicionarPizzaCarrinho(String nome, String tamanho, String descricao, String valor) {
    Pedido p = Pedido(nome, tamanho, descricao, valor, true, "Em preparo");
    listPedido.add(p);
    notifyListeners();
  }

  void adicionarBebidasCarrinho(String nome, String tamanho, String descricao, String valor) {
    Pedido p = Pedido(nome,tamanho, descricao, valor, false, "pronto");
    listPedido.add(p);
    notifyListeners();
  }

  void removerPedidoCarrinho(Pedido pedido) {
    listPedido.remove(pedido);
    notifyListeners();
  }

  void removerItensCarrinho() {
    listPedido.removeRange(0, listPedido.length);
    notifyListeners();
  }

  //Farebase
  void adicionarPedidosBD(String mesa) async {
     List<Pedido> pedido = listPedido;
    Firestore db = Firestore.instance;
    for(int i= 0; i < pedido.length; i++){
      DocumentReference ref = await db.collection(mesa).add({
      "nome": pedido[i].nome,
      "tamanho" : pedido[i].tamanho,
      "descricao": pedido[i].descricao,
      "valor": pedido[i].valor,
      "pizza" : pedido[i].pizza,
      "status" : pedido[i].status
    });

    }
    listPedido.removeRange(0, listPedido.length);
    notifyListeners();
  }

  void removerTodosPedidosBD(String id) async {
    Firestore db = Firestore.instance;
    final docs = await db.collection(id).getDocuments();
    for (final doc in docs.documents) {
      db.collection(id).document(doc.documentID).delete();
    }
    notifyListeners();
  }

  Future<List<Pedido>> recuperarPedidosBD(String valor) async {
    Firestore db = Firestore.instance;
    QuerySnapshot querySnapshot = await db.collection(valor).orderBy("status", descending: false).getDocuments();

    List<Pedido> listaPedidos = List<Pedido>();
    for (DocumentSnapshot item in querySnapshot.documents) {
      var dados = item.data;
      Pedido p = Pedido(dados["nome"], dados["tamanho"], dados["descricao"], dados["valor"], dados["pizza"], dados["status"]);

        listaPedidos.add(p);
      
    }
    notifyListeners();
    return listaPedidos;
  }

  void adicionarPedidosFinalizadosBD(String nome, String valor, String id) async {
    PedidoFinalizado p = PedidoFinalizado(nome, valor, DateTime.now().toString());
    Firestore db = Firestore.instance;
      DocumentReference ref = await db.collection("pedidoFinalizado").add({
        "nome": p.nome,
        "valor": p.valor,
        "data" : p.data
      });
    removerTodosPedidosBD(id);
    notifyListeners();
  }

  Future<List<PedidoFinalizado>> recuperarPedidosFinalizadosBD() async {
    Firestore db = Firestore.instance;
    QuerySnapshot querySnapshot = await db.collection("pedidoFinalizado").orderBy("data", descending: true).getDocuments();

    List<PedidoFinalizado> listaPedido = List<PedidoFinalizado>();
    for (DocumentSnapshot item in querySnapshot.documents) {
      var dados = item.data;
      PedidoFinalizado p = PedidoFinalizado(dados["nome"], dados["valor"], dados["data"]);

      listaPedido.add(p);
    }
    notifyListeners();
    return listaPedido;
  }


}
