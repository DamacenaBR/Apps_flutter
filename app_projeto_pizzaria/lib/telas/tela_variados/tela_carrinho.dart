import 'package:app_projeto_pizzaria/model/pedido.dart';
import 'package:app_projeto_pizzaria/provider/controller_provider.dart';
import 'package:app_projeto_pizzaria/telas/telasController/tela_controller_principal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaCarrinho extends StatelessWidget {
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  String _mesa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('Carrinho', style: TextStyle(fontSize: 25)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.remove_circle),
            onPressed: () {
              _dialogLimparCarrinho(context);
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
      return _listView(incrementeProduto);
    });
  }

  _listView(IncrementeProvider incrementePedido) {
    return ListView.builder(
      itemCount: incrementePedido.listPedido.length,
      itemBuilder: (context, index) {
        return _itemList(context, incrementePedido.listPedido[index], index,
            incrementePedido);
      },
    );
  }

  _itemList(BuildContext context, Pedido pedido, int index,
      IncrementeProvider incrementePedido) {
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
                      'Valor total de R\$ ${somarElemento(incrementePedido.listPedido).toStringAsPrecision(3)} reais',
                      style: TextStyle(fontSize: 20, color: Colors.blue))
                  : null,
            ),
            ListTile(
              leading: CircleAvatar(
                child: Text(
                  "${pedido.nome[0]}",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
              trailing: IconButton(
                color: Colors.red,
                icon: Icon(Icons.delete_forever),
                onPressed: () {
                  _dialogRemoverProduto(context, pedido);
                },
              ),
              title: Text(pedido.nome,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text(
                  "Valor: R\$ ${pedido.valor.toString()}\nTamanho: ${pedido.tamanho}",
                  style: TextStyle(fontSize: 15)),
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

  _dialogRemoverProduto(BuildContext context, Pedido pedido) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                title: Text("Quer remover esse produto?"),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15),
                    side: BorderSide(color: Colors.blue)),
                content: Text(
                  "Nome: ${pedido.nome}",
                  textAlign: TextAlign.justify,
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "Confirmar",
                      style: TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Provider.of<IncrementeProvider>(context)
                          .removerPedidoCarrinho(pedido);
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

  _dialogLimparCarrinho(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                title: Text("Deseja limpar o carrinho?"),
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
                          .removerItensCarrinho();
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

  _dialogFinalizarPedido(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
                child: AlertDialog(
              title: Text("Finalizar pedido"),
              content: Form(
                key: _keyForm,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: "Mesa",
                          hintText: "Digite o numero da mesa"),
                      onSaved: (mesa) {
                        _mesa = mesa;
                      },
                      validator: (mesa) {
                        if (mesa.trim().length < 1) {
                          return "Digite o numero da mesa";
                        } else {
                          return validaNumeroMesa(mesa);
                        }
                      },
                    ),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15),
                  side: BorderSide(color: Colors.blue)),
              actions: <Widget>[
                FlatButton(
                  child: Text("Confirmar"),
                  onPressed: () {
                    if (_keyForm.currentState.validate()) {
                      _keyForm.currentState.save();

                      Provider.of<IncrementeProvider>(context)
                          .adicionarPedidosBD(_mesa);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => TelaControllerPrincipal()),
                          (_) => false);
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
        });
  }

  String validaNumeroMesa(String numero) {
    int numero1 = int.parse(numero);
    if (identical(numero1, 1) ||
        identical(numero1, 2) ||
        identical(numero1, 3) ||
        identical(numero1, 4) ||
        identical(numero1, 5) ||
        identical(numero1, 6) ||
        identical(numero1, 7) ||
        identical(numero1, 8) ||
        identical(numero1, 9) ||
        identical(numero1, 10)) {
      return null;
    } else {
      return "Numeros de mesas possiveis 1 a 10";
    }
  }
}
