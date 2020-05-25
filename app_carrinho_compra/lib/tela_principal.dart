import 'package:app_carrinho_compra/produto.dart';
import 'package:app_carrinho_compra/produto_provider.dart';
import 'package:app_carrinho_compra/prudoto_api.dart';
import 'package:app_carrinho_compra/tela_secundaria.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaPrincipal extends StatelessWidget {
  @override
  String quantProtudo(int quant) {
    if (quant <= 1) {
      return '${quant} ITEM';
    } else if (quant > 1) {
      return '${quant} ITENS';
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          'Produtos',
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Center(
                  child: Consumer<IncrementeProduto>(
                    builder: (context, incrementeProduto, child) {
                      return Text(
                          '${quantProtudo(incrementeProduto.listProdutosSecundario.length)}');
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.shopping_cart,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TelaSecundaria();
          }));
        },
      ),
    );
  }

  _body(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: ProdutoApi.getProdutos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
              ),
            );
          }
          List<Produto> listaProdutos = snapshot.data;
          return _listView(listaProdutos);
        },
      ),
    );
  }

  _listView(List<Produto> listaProdutos) {
    return ListView.builder(
      itemCount: listaProdutos.length,
      itemBuilder: (context, index) {
        return _itemList(context, listaProdutos[index]);
      },
    );
  }

  _itemList(BuildContext context, Produto produto) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(produto.nome),
              subtitle: Text(produto.descricao),
              trailing: Text(
                produto.preco.toString(),
                style: TextStyle(backgroundColor: Colors.yellow),
              ),
              onTap: () {
                _dialog(context, produto);
              },
            ),
          ],
        ),
      ),
    );
  }

  _dialog(BuildContext context, Produto produto) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Quer add esse produto ?"),
            content: Text(
                "Nome: ${produto.nome}\nDescrição: ${produto.descricao}\nPreço: ${produto.preco.toString()}"),
            actions: <Widget>[
              FlatButton(
                child: Text("Sim"),
                onPressed: () {
                  Provider.of<IncrementeProduto>(context).checkProduto(produto);
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
