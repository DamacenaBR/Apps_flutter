import 'package:app_carrinho_compra/produto.dart';
import 'package:flutter/foundation.dart';

class IncrementeProduto extends ChangeNotifier {
  List<Produto> listProdutosSecundario = List<Produto>();
  void checkProduto(Produto produto) {
    listProdutosSecundario.add(produto);
    notifyListeners();
  }

   /*String quantProtudo(int quant){
    if (quant <= 1) {
      return '${quant} ITEM  ';
    }
    else if(quant > 1){
      return '${quant} ITENS  ';
    }
    notifyListeners();
  }*/

  void removerProduto(Produto produto){
    listProdutosSecundario.remove(produto);
    notifyListeners();
  }
  
}
