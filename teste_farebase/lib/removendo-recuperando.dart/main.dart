import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {

  Firestore db = Firestore.instance;

  //db.collection("usuarios").document("003").delete();
  /*
  DocumentSnapshot snapshot = await db.collection("usuarios")
      .document("002")
      .get();

  var dados = snapshot.data;
  print("dados nome: " + dados["nome"] + " idade: " + dados["idade"] );
  */
  /*
  QuerySnapshot querySnapshot = await db
      .collection("usuarios")
      .getDocuments();*/

  //print("dados usuarios: " + querySnapshot.documents.toString() );
  /*
  for( DocumentSnapshot item in querySnapshot.documents ){
    var dados = item.data;
    print("dados usuarios: " + dados["nome"] + " - " + dados["idade"] );
  }*/

  db.collection("usuarios").snapshots().listen(
      ( snapshot ){

        for( DocumentSnapshot item in snapshot.documents ){
          var dados = item.data;
          print("dados usuarios: " + dados["nome"] + " - " + dados["idade"] );
        }

      }
  );

  runApp(App());

}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
  
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }
  _body(){
    return Container(
      child: Column(
        children: <Widget>[
          Text("TEste"),
        ],
      ),
    );
  }
}

