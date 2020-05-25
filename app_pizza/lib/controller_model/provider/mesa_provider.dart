import 'package:app_pizza/model/pedido.dart';
import 'package:flutter/foundation.dart';

class IncrementeCarrinho extends ChangeNotifier {

  List<Pedido> listPedido = List<Pedido>();

  void checkMesaPizza(String nome, String descricao, String valor) {
    Pedido p = Pedido(nome, descricao, valor);
    listPedido.add(p);
    notifyListeners();
  }

  void checkMesaBebidas(String nome, String descricao, String valor) {
    Pedido p = Pedido(nome, descricao, valor);
    listPedido.add(p);
    notifyListeners();
  }

  void removerPedido(Pedido pedido) {
    listPedido.remove(pedido);
    notifyListeners();
  }

  void removerTudo(){
    listPedido.removeRange(0, listPedido.length);
    notifyListeners();
  }
}
