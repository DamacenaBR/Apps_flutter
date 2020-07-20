import 'package:curso_flutter/app9_notas_diarias-sqflite/controller/RepositoryAnotacoes.dart';
import 'package:curso_flutter/app9_notas_diarias-sqflite/model/Anotacoes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();

  RepositoryAnotacoes _repository = RepositoryAnotacoes();
  List<Anotacoes> _listAnotacoes = [];

  _formatarData(String data) {
    initializeDateFormatting("pt_BR");
    //var formatador = DateFormat("dd/MM/yyyy HH:mm:ss");
    var formatador = DateFormat.yMMMMEEEEd("pt_BR");
    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formatador.format(dataConvertida);
    return dataFormatada;
  }

  _salvarAtualizarAnotacoes({Anotacoes anotacaoSelecioanda}) async {
    String titulo = _tituloController.text;
    String descricao = _descricaoController.text;
    String data = DateTime.now().toString();

    if (anotacaoSelecioanda == null) {//Salvando
      Anotacoes anotacao =
          Anotacoes(titulo: titulo, descricao: descricao, data: data);
      int resultado = await _repository.inserirAnotacao(anotacao);
    } else {//atualizando
      anotacaoSelecioanda.titulo = titulo;
      anotacaoSelecioanda.descricao = descricao;
      anotacaoSelecioanda.data = data;
      int resultado = await _repository.atualizarAnotacao(anotacaoSelecioanda);
    }

    _descricaoController.clear();
    _tituloController.clear();

    _recuperarAnotacoes();
  }

  _recuperarAnotacoes() async {
    List anotacaoRecuperada = await _repository.recuperarAnotacoes();
    List<Anotacoes> listaTemporaria =
        anotacaoRecuperada.map((e) => Anotacoes.fromJson(e)).toList();
    setState(() {
      _listAnotacoes = listaTemporaria;
    });
  }

  _removerAnotacoes(int id) async{
    int retorno = await _repository.deletar(id);
    _recuperarAnotacoes();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _recuperarAnotacoes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.lightGreen,
      title: Text("Minhas Anotações"),
    );
  }

  _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.green,
        focusColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          _exibirTelaCasdastraOrEditar(context);
        });
  }

  _exibirTelaCasdastraOrEditar(BuildContext context, {Anotacoes anotacao}) {
    return showDialog(
        context: context,
        builder: (context) {
          return _alertDialog(context, anotacao: anotacao);
        });
  }

  _alertDialog(BuildContext context, {Anotacoes anotacao}) {
    String textoSalvarAtualizar = "";
    if( anotacao == null ){//salvando
      _tituloController.text = "";
      _descricaoController.text = "";
      textoSalvarAtualizar = "Salvar";
    }else{//atualizar
      _tituloController.text = "";
      _descricaoController.text = "";
      _tituloController.text = anotacao.titulo;
      _descricaoController.text = anotacao.descricao;
      textoSalvarAtualizar = "Atualizar";
    }
    return AlertDialog(
      title: Center(
        child: Text(textoSalvarAtualizar),  
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _textFild(_tituloController, true, "Título", "Digite titulo..."),
          _textFild(
              _descricaoController, false, "Descricao", "Digite a descricao.."),
        ],
      ),
      actions: <Widget>[
        FlatButton(
            child: Text("Cancelar"), onPressed: () => Navigator.pop(context)),
        FlatButton(
            child: Text("Salvar"),
            onPressed: () {
              _salvarAtualizarAnotacoes(anotacaoSelecioanda: anotacao);
              Navigator.pop(context);
            }),
      ],
    );
  }

  _textFild(TextEditingController controller, bool autofocus, String labelText,
      String hingText) {
    return TextField(
      controller: controller,
      autofocus: autofocus,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hingText,
      ),
    );
  }

  _body() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[Expanded(child: _listViewBuilder(_listAnotacoes))],
      ),
    );
  }

  _listViewBuilder(List listAnotacoes) {
    return ListView.builder(
        itemCount: listAnotacoes.length,
        itemBuilder: (context, index) {
          return _listView(context, listAnotacoes[index], index);
        });
  }

  _listView(BuildContext context, Anotacoes anotacao, int index) {
    return Card(
      child: ListTile(
        title: Text(
          "${anotacao.titulo}",
          style: TextStyle(fontSize: 18),
        ),
        subtitle: Text(
            "Data: ${_formatarData(anotacao.data)}\nDescrição: ${anotacao.descricao}"),
        trailing: _listTileIcons(context, anotacao),
      ),
    );
  }

  _listTileIcons(BuildContext context, Anotacoes anotacao) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: () =>
              _exibirTelaCasdastraOrEditar(context, anotacao: anotacao),
          child: Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.edit,
              color: Colors.green,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _showDialogRemover(context, anotacao),
          child: Padding(
            padding: EdgeInsets.only(right: 0),
            child: Icon(
              Icons.remove_circle,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }


  _showDialogRemover(BuildContext context, Anotacoes anotacao) {
    return showDialog(
        context: context,
        builder: (context) {
          return _alertDialogRemover(context, anotacao);
        });
  }

  _alertDialogRemover(BuildContext context,Anotacoes anotacao) {

    return AlertDialog(
      title: Center(
        child: Text("Deseja remover?"),  
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
      ),
      actions: <Widget>[
        FlatButton(
            child: Text("Cancelar"), onPressed: () => Navigator.pop(context)),
        FlatButton(
            child: Text("Remover"),
            onPressed: () {
              _removerAnotacoes(anotacao.id);
              Navigator.pop(context);
            }),
      ],
    );
  }
}
