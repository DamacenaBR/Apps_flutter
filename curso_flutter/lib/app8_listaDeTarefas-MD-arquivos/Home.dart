import 'package:curso_flutter/app8_listaDeTarefas-MD-arquivos/tarefa.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List _listaTarefas = List();
  TextEditingController _controllerTarefa = TextEditingController();

  _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    var arquivo = File("${diretorio.path}/dados.json");
    return arquivo;
  }

  _salvarTarefa() {
    String _textoDigitado = _controllerTarefa.text;
    Tarefa _tarefa = Tarefa(titulo: _textoDigitado, realizada: false);
    setState(() {
      _listaTarefas.add(_tarefa);
    });
    _salvarArquivo();
    _controllerTarefa.text = "";
  }

  _salvarArquivo() async {
    var arquivo = await _getFile();
    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
  }

  _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    //carreagando a lista antes do builder do app
    _lerArquivo().then((dados) {
      setState(() {
        var tarefas = json.decode(dados);
        _listaTarefas = tarefas.map((e) => Tarefa.fromJson(e)).toList();
      }
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: _floatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        elevation: 10,
        onPressed: () {
          _showDialog(context);
        });
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors.purple,
      title: Text("Lista de Tarefas"),
      centerTitle: true,
    );
  }

  _body() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[Expanded(child: _listViewBuilder(_listaTarefas))],
      ),
    );
  }

  _listViewBuilder(List listTarefas) {
    return ListView.builder(
        itemCount: listTarefas.length,
        itemBuilder: (context, index) {
          return _dismissible(listTarefas[index], index);
        });
  }

  _dismissible(Tarefa tarefa, int index) {
    final _chave = DateTime.now().millisecondsSinceEpoch.toString();
    return Dismissible(
        background: _containerDismissible(
            MainAxisAlignment.end,
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Colors.red),
        direction: DismissDirection.endToStart,
        key: Key(_chave),
        onDismissed: (direction) {

          //recuperar o ultimo item excluido
          Tarefa _ultimaTarefaRemovida = tarefa;

          //remover da lista
          _listaTarefas.removeAt(index);
          _salvarArquivo();

          //snackBar
          final snackBar = _snackBar(_ultimaTarefaRemovida, index);
          _scaffoldKey.currentState.showSnackBar(snackBar);
        },
        child: _checkboxListView(tarefa));
  }

  _snackBar(Tarefa tarefa, int index) {
    return SnackBar(
      duration: Duration(seconds: 5),
      content: Text("Tarefa removida!!"),
      action: SnackBarAction(
        label: "Desfazer",
        onPressed: (){
          setState(() {

            //recuperado item removido
            _listaTarefas.insert(index, tarefa);

          });

          //salvando arquivo novamente
          _salvarArquivo();
        }
      ),
    );
  }

  _containerDismissible(
    MainAxisAlignment mainAxisAlignment, dynamic icon, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: <Widget>[icon],
      ),
      color: color,
    );
  }

  _checkboxListView(Tarefa tarefa) {
    return CheckboxListTile(
        title: Text(
          tarefa.titulo,
          style: TextStyle(fontSize: 18),
        ),
        value: tarefa.realizada,
        checkColor: Colors.white,
        activeColor: Colors.purple,
        onChanged: (valorAterado) {
          setState(() {
            //mudar estado checkbox
            tarefa.realizada = valorAterado;
          });
          _salvarArquivo();
        });
  }

  _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return _alertDialog(context);
        });
  }

  _alertDialog(BuildContext context) {
    return AlertDialog(
      title: Text("Adicionar Tarefas"),
      content: _textFild(),
      actions: <Widget>[
        FlatButton(
            child: Text("Cancelar"), onPressed: () => Navigator.pop(context)),
        FlatButton(
            child: Text("Salvar"),
            onPressed: () {

              //salvar nova tarefa
              _salvarTarefa();

              Navigator.pop(context);
            }),
      ],
    );
  }

  _textFild() {
    return TextField(
      controller: _controllerTarefa,
      decoration: InputDecoration(
        labelText: "Digite sua tarefa",
      ),
      onChanged: (text) {},
    );
  }
}
