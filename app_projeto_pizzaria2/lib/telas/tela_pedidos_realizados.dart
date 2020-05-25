import 'package:app_projeto_pizzaria2/model/pedido.dart';
import 'package:app_projeto_pizzaria2/provider/controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaPedidosRealizados extends StatefulWidget {
  String valor;
  TelaPedidosRealizados(this.valor);

  @override
  _Mesa1State createState() => _Mesa1State();
}

class _Mesa1State extends State<TelaPedidosRealizados> {
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
      ),
      body: _body(context),
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
                  ? Text("Pedidos",
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
              subtitle: Text("Valor: R\$ ${pedido.valor.toString()}\nStatus: ${pedido.status}",
                  style: TextStyle(fontSize: 15)),
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
              onTap: (){
                _dialogMudarStatus(context, pedido);
              },
            ),
          ],
        ),
      ),
    );
  }

  _dialogMudarStatus(BuildContext context, Pedido pedido) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                title: Text("Mudar status do pedido!"),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15),
                    side: BorderSide(color: Colors.blue)),
                content: Text(
                  "Nome: ${pedido.nome}\n\nENGREDIENTES: ${pedido.descricao}",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                  maxLines: 5,
                ),
                actions: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            FlatButton(
                              child: Text("Confirmar"),
                              onPressed: () {
                                Provider.of<IncrementeProvider>(context)
                                    .atualizarPedidosBD(widget.valor, pedido.id, pedido);
                                Navigator.pop(context);
                              },
                            ),
                            
                            FlatButton(
                              child: Text("Cancelar"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
