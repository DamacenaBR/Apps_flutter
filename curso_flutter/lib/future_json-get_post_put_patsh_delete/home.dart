import 'package:curso_flutter/future_json-get_post_put_patsh_delete/dados.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

String _urlBase = "https://jsonplaceholder.typicode.com";

//get recuperar recursos
class _HomeState extends State<Home> {
  Future<Dados> _recuperarPost_1() async {
    String url = _urlBase + "/posts/1";
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return Dados.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  //get recuperar recursos
  Future<List<Dados>> _recuperarPost() async {
    String url = _urlBase + "/posts";
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      List list = json.decode(response.body);
      List<Dados> _getDados = List<Dados>();
      _getDados = list.map((model) => Dados.fromJson(model)).toList();
      return _getDados;
    } else {
      return null;
    }
  }

  /*
  var dadosJson = json.decode( response.body );
    List<Dados> postagens = List();
    for( var Dados in dadosJson ){     
      print("Dados: " + Dados["title"] );
      Dados p = Dados(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add( p );   
    }
    return postagens;
  */

  //post criar um novo produto ex: tipo subir um novo novo video
  _post() async {
    Dados post = new Dados(
        userId: 120, id: null, title: "Titulo", body: "Corpo da postagem - post");

    var corpo = json.encode(post.toJson());

    http.Response response = await http.post(_urlBase + "/posts",
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: corpo);
    if(response.statusCode == 201){
      print("resposta: Post");
      print("resposta: ${response.body}");
    }
    else{
      print("Erro: ${response.statusCode}");
    }
  }

  //put atualizar um produto obs: presisa do id do produto
  _put(String id) async {
    Dados post = new Dados(
        userId: 120,
        id: null,
        title: "Titulo alterado",
        body: "Corpo da postagem alterado - put");
    var corpo = json.encode(post.toJson());

    http.Response response = await http.put(_urlBase + "/posts/${id}",
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: corpo);

    if(response.statusCode == 200){
      print("resposta: Put");
      print("resposta: ${response.body}");
    }
    else{
      print("Erro: ${response.statusCode}");
    }  
  }

  //patch atualiza recurso especifico , tipo o nome ou preço do produto
  _patch(String id) async {
    Dados post = new Dados(
        userId: 120,
        id: null,
        title: null,
        body: "Corpo da postagem alterado - patch");
    var corpo = json.encode(post.toJson());

    http.Response response = await http.patch(_urlBase + "/posts/${id}",
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: corpo);

    if(response.statusCode == 200){
      print("resposta: Post");
      print("resposta: ${response.body}");
    }
    else{
      print("resposta: Patch");
      print("Erro: ${response.statusCode}");
    }
  }

  //delete remove o recurso. ex: remove o produto
  _delete(String id) async{
    http.Response response = await http.delete(_urlBase + "/posts/${id}");

    if(response.statusCode == 200){
      print("resposta: Delete");
      print("resposta: ${response.body}");
    }
    else{
      print("Erro: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blue,
      title: Text("Future Json - Requisições"),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text("Post"),
                onPressed: () => _post(),
              ),
              RaisedButton(
                child: Text("Put"),
                onPressed: () => _put("2"),
              ),
              RaisedButton(
                child: Text("Patch"),
                onPressed: () => _patch("2"),
              ),
              RaisedButton(
                child: Text("Delete"),
                onPressed: () => _delete("2"),
              )
            ],
          ),
          Expanded(
              child: FutureBuilder<List<Dados>>(
                  future: _recuperarPost(),
                  builder: (context, snapshot) {
                    String _resultado;
                    switch (snapshot.connectionState) {
                      case ConnectionState.none: //estado da conexão nulo
                      case ConnectionState
                          .waiting: //estado da conexão carregando
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      case ConnectionState
                          .active: //se mantem rebendo dados por um tempo utilizando em stream, continua ativo
                      case ConnectionState
                          .done: //terminou o processo de recuperação de dados
                        if (snapshot.hasError) {
                          _resultado = "Erro ao carregar os dados.";
                        } else {
                          List<Dados> _listPost = snapshot.data;
                          return _listViewBuilder(_listPost);
                        }
                        break;
                    }
                  }))
        ],
      ),
    );
  }

  _listViewBuilder(List<Dados> listDados) {
    return ListView.builder(
        itemCount: listDados.length,
        itemBuilder: (context, index) {
          return _listView(listDados[index]);
        });
  }

  _listView(Dados dados) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ListTile(
        title: Text("ID: ${dados.id}\nTitle: ${dados.title}"),
        subtitle: Text("Corpo: ${dados.body}"),
      ),
    );
  }

  _bottomNavigationBar() {
    return null;
  }
}
