import 'package:app_carrinho_compra/produto.dart';
import 'package:app_carrinho_compra/tela_principal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'produto_provider.dart';

class TelaSecundaria extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Consumer<IncrementeProduto>(
            builder: (context, incrementeProduto, child) {
              return Text(
                  'Valor de R\$ ${somarElemento(incrementeProduto.listProdutosSecundario).toStringAsPrecision(3) }');
            },
          )),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Consumer<IncrementeProduto>(
        builder: (context, incrementeProduto, child) {
      return _listView(incrementeProduto);
    });
  }

  _listView(IncrementeProduto incrementeProduto) {
    return ListView.builder(
      itemCount: incrementeProduto.listProdutosSecundario.length,
      itemBuilder: (context, index) {
        return _itemList(
            context, incrementeProduto.listProdutosSecundario[index]);
      },
    );
  }

  _itemList(BuildContext context, Produto produto) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(3),
        child: Column(
          children: <Widget>[
            ListTile(
              onTap: (){
                _dialog(context, produto);
              },
              title: Text(produto.nome),
              subtitle: Text(produto.preco.toString()),
            ),
          ],
        ),
      ),
    );
  }

  double somarElemento(List<Produto> listProduto) {
    double somar = 0;
    for (int i = 0; i < listProduto.length; i++) {
      somar += listProduto[i].preco;
    }
    return somar;
  }

   _dialog(BuildContext context, Produto produto) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Quer remover esse produto ?"),
            content: Text(
                "Nome: ${produto.nome}\nDescrição: ${produto.descricao}\nPreço: ${produto.preco.toString()}"),
            actions: <Widget>[
              FlatButton(
                child: Text("Sim"),
                onPressed: () {
                  Provider.of<IncrementeProduto>(context).removerProduto(produto);
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TelaPrincipal()));
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Não"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
