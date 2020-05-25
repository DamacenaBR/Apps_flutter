import 'package:app_projeto_pizzaria/model/pedido.dart';
import 'package:app_projeto_pizzaria/provider/controller_provider.dart';
import 'package:app_projeto_pizzaria/telas/telasController/tela_controller_principal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaPedidosRealizadosSecundaria extends StatefulWidget {
  String valor;
  TelaPedidosRealizadosSecundaria(this.valor);

  @override
  _Mesa1State createState() => _Mesa1State();
}

class _Mesa1State extends State<TelaPedidosRealizadosSecundaria> {
  String valorTotalCompra;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Mesa ${widget.valor}",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.remove_circle),
            onPressed: () {
              _dialogCancelarPedidos(context);
            },
          ),
        ],
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.save_alt,
        ),
        onPressed: () {
          _dialogFinalizarPedido(context);
        },
      ),
    );
  }

  _body(BuildContext context) {
    return Consumer<IncrementeProvider>(
        builder: (context, incrementeProduto, child) {
      return FutureBuilder(
        future: incrementeProduto.recuperarPedidosBD(widget.valor),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          }
          List<Pedido> listaPedido = snapshot.data;
          return _listView(listaPedido);
        },
      );
    });
  }

  _listView(List<Pedido> listaPedido) {
    return ListView.builder(
      itemCount: listaPedido.length,
      itemBuilder: (context, index) {
        return _itemList(context, listaPedido[index], index, listaPedido);
      },
    );
  }

  _itemList(
      BuildContext context, Pedido pedido, int index, List<Pedido> listpedido) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: index == 0 ? EdgeInsets.all(10) : null,
              child: index == 0
                  ? Text(
                      "Pedidos / Valor total de R\$ ${somarValorTotal(listpedido).toStringAsPrecision(3)} reais",
                      style: TextStyle(fontSize: 20, color: Colors.blue))
                  : null,
            ),
            ListTile(
              leading: CircleAvatar(
                child: Text(
                  pedido.nome[0],
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
              title: Text(
                pedido.nome,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: Column(
                children: <Widget>[
                  Text(
                    'Tamanho',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "${pedido.tamanho}",
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              subtitle: Text(
                  "Valor: R\$ ${pedido.valor.toString()}\nStatus: ${pedido.status}",
                  style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }

  _dialogCancelarPedidos(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                title: Text("Deseja cancelar a venda?"),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15),
                    side: BorderSide(color: Colors.blue)),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "Confirmar",
                      style: TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Provider.of<IncrementeProvider>(context)
                          .removerTodosPedidosBD(widget.valor);
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text(
                      "Cancelar",
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

  double somarValorTotal(List<Pedido> listPedido) {
    double somar = 0;
    for (int i = 0; i < listPedido.length; i++) {
      double valor = double.parse(listPedido[i].valor.toString());
      somar += valor;
    }
    return somar;
  }

  _dialogFinalizarPedido(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Consumer<IncrementeProvider>(
            builder: (context, incrementePedido, child) {
              return Center(
                child: SingleChildScrollView(
                    child: AlertDialog(
                  title: Text("Finalizar venda"),
                  content: _futureBuilder(incrementePedido),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15),
                      side: BorderSide(color: Colors.blue)),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirmar"),
                      onPressed: () {
                        String mesa = "Mesa ${widget.valor.toString()}";
                        if (valorTotalCompra != "0.0") {
                          incrementePedido.adicionarPedidosFinalizadosBD(
                              mesa, valorTotalCompra, widget.valor);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TelaControllerPrincipal()));
                        }
                      },
                    ),
                    FlatButton(
                      child: Text("Cancelar"),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                )),
              );
            },
          );
        });
  }

  _futureBuilder(IncrementeProvider incrementePedido) {
    return FutureBuilder(
      future: incrementePedido.recuperarPedidosBD(widget.valor),
      builder: (context, snap) {
        if (snap.hasData) {
          List<Pedido> p = snap.data;
          valorTotalCompra = somarValorTotal(p).toString();
          return Text("Valor total de R\$ ${valorTotalCompra} reais");
        } else {
          return Text("caregando...");
        }
      },
    );
  }
}
