import 'package:app_projeto_pizzaria/model/pedido_finalizado.dart';
import 'package:app_projeto_pizzaria/provider/controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TElaVendaFinalizada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pedidos Finalizados",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.blue,
      ),
      body: _body(),
    );
  }

  _body() {
    return Consumer<IncrementeProvider>(
        builder: (context, incrementeProduto, child) {
      return FutureBuilder(
        future: incrementeProduto.recuperarPedidosFinalizadosBD(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          }
          List<PedidoFinalizado> listaPedido = snapshot.data;
          return _listView(listaPedido);
        },
      );
    });
  }

  _listView(List<PedidoFinalizado> listaPedido) {
    return ListView.builder(
      itemCount: listaPedido.length,
      itemBuilder: (context, index) {
        return _itemList(context, listaPedido[index], index, listaPedido);
      },
    );
  }

  _itemList(
      BuildContext context, PedidoFinalizado pedido, int index, List<PedidoFinalizado> listaPedido) {
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
                      "Vendas no valor total de R\$ ${somarElemento(listaPedido).toStringAsPrecision(3)} reais",
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
              subtitle: Text("${_formatarData(pedido.data)}"),
              trailing: Text("Valor: R\$ ${pedido.valor.toString()}",
                  style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }

  _formatarData(String data) {
    initializeDateFormatting('pt_BR');
    //Year -> y month-> M Day -> d
    // Hour -> H minute -> m second -> s
    //var formatador = DateFormat("d/MMMM/y H:m:s");
    var formatador = DateFormat.yMd("pt_BR");
    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formatador.format(dataConvertida);
    return dataFormatada;
  }

  double somarElemento(List<PedidoFinalizado> listPedido) {
    double somar = 0;
    for (int i = 0; i < listPedido.length; i++) {
      double valor = double.parse(listPedido[i].valor.toString());
      somar += valor;
    }
    return somar;
  }
}