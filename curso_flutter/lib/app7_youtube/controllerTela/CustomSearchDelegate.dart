import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = ""; // botao limpar
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, ""); //botao de voltar, retornando campo vazio
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //print("Resultado: pesquisa realizada");
    close(context, query);
    return Container(); //botao resultado retornando o resultado query
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //print("Resultado: " + query);
    //return Container();
    
    List<String> lista = List();
    if (query.isNotEmpty) {
      //caso a query não esteja vaiza
      lista = ["Android", "Android navegação", "IOS", "Jogos"].where((texto) => texto.toLowerCase().startsWith(query.toLowerCase())).toList();

      return _listViewBuilder(lista);
    } else {
      return Center(
        child: Text("Nenhum resultado para a pesquisa!"),
      );
    }
  }

  _listViewBuilder(List<String> sugestoes) {
    return ListView.builder(
        itemCount: sugestoes.length,
        itemBuilder: (context, index) {
          return _listView(sugestoes[index], context);
        });
  }

  _listView(String sugestao, BuildContext context) {
    return ListTile(
      title: Text(sugestao),
      onTap: (){
        close(context, sugestao);
      },
    );
  }
}
