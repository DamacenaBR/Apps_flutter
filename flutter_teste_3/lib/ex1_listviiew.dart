import "package:flutter/material.dart";
import 'package:flutter_teste_3/pessoa.dart';

class ExemploListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _listView3(),
    );
  }
}

_listView1() {
  return ListView(
    children: <Widget>[
      Text(
        "Maria",
        style: TextStyle(fontSize: 20),
      ),
      Text(
        "José",
        style: TextStyle(fontSize: 20),
      ),
      Text(
        "Miguel",
        style: TextStyle(fontSize: 20),
      ),
      Text(
        "Yoda",
        style: TextStyle(fontSize: 20),
      ),
    ],
  );
}

_listView2() {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: CircleAvatar(
          child: Text("M"),
        ),
        title: Text("Maria"),
        subtitle: Text("maria@gmail.com"),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          print("Maria");
        },
        onLongPress: () {
          print("maria@gmail.com");
        },
      ),
      ListTile(
        leading: CircleAvatar(
          child: Text("J"),
          backgroundColor: Colors.green,
        ),
        title: Text("José"),
        subtitle: Text("josé@gmail.com"),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          print("José");
        },
        onLongPress: () {
          print("josé@gmail.com");
        },
      )
    ],
  );
}

_listView3() {
  List<Pessoa> pessoas = List<Pessoa>();
  pessoas.add(Pessoa("Maria Lima", "maria@gmail.com"));
  pessoas.add(Pessoa("José Lima", "jose@gmail.com"));
  pessoas.add(Pessoa("Yoda Lima", "yoda@gmail.com"));
  pessoas.add(Pessoa("Miguel Lima", "miguel@gmail.com"));
  pessoas.add(Pessoa("Carlos Lima", "carlos@gmail.com"));

  return ListView.builder(
    itemCount: pessoas.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: CircleAvatar(
          child: Text(pessoas[index].nome[0]),
        ),
        title: Text(pessoas[index].nome),
        subtitle: Text(pessoas[index].email),
        trailing: Icon(Icons.arrow_forward),
        onTap: (){
          print(pessoas[index].nome);
        },
        onLongPress: (){
          print(pessoas[index].email);
        },
      );
    },
  );
}
