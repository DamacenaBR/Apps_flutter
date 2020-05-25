import 'package:app_pizza/controller_model/provider/mesa_provider.dart';
import 'package:app_pizza/model/pedido.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaCarrinho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Consumer<IncrementeCarrinho>(
          builder: (context, incrementePedido, child) {
            return Text(
                'Valor de R\$ ${somarElemento(incrementePedido.listPedido).toStringAsPrecision(3)}');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.remove_circle),
            onPressed: () {
              _dialog1(context);
            },
          ),
        ],
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Consumer<IncrementeCarrinho>(
        builder: (context, incrementeProduto, child) {
      return _listView(incrementeProduto);
    });
  }

  _listView(IncrementeCarrinho incrementePedido) {
    return ListView.builder(
      itemCount: incrementePedido.listPedido.length,
      itemBuilder: (context, index) {
        return _itemList(context, incrementePedido.listPedido[index]);
      },
    );
  }

  _itemList(BuildContext context, Pedido pedido) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(2),
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text("data"),
              ),
            ),
            SizedBox(
              child: Card(
                child: ListTile(
                  trailing: IconButton(
                    icon: Icon(Icons.delete_forever),
                    onPressed: () {
                      _dialog(context, pedido);
                    },
                  ),
                  title: Text(pedido.nome,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text("Valor: R\$ ${pedido.valor.toString()}",
                      style: TextStyle(fontSize: 15)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double somarElemento(List<Pedido> listPedido) {
    double somar = 0;
    for (int i = 0; i < listPedido.length; i++) {
      double valor = double.parse(listPedido[i].valor.toString());
      somar += valor;
    }
    return somar;
  }

  _dialog(BuildContext context, Pedido pedido) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
            child: AlertDialog(
              title: Text("Quer remover esse produto?"),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15), side: BorderSide(color: Colors.blue)),
              content: Text(
                "Nome: ${pedido.nome}",
                textAlign: TextAlign.justify,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "Sim",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Provider.of<IncrementeCarrinho>(context)
                        .removerPedido(pedido);
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text(
                    "Não",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          );
        });
  }

  _dialog1(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
            child: AlertDialog(
              title: Text("Deseja limpar o carrinho?"),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15), side: BorderSide(color: Colors.blue)),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "Sim",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Provider.of<IncrementeCarrinho>(context).removerTudo();
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text(
                    "Não",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          );
        });
  }
}
