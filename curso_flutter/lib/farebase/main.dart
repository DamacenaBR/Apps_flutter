import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firestore db = Firestore.instance;

  //SALVANDO E ATUALIZANDO

  db
      .collection("usuarios")
      .document("002")
      .setData({"nome": "Ana Maria Silva", "idade": "25"});

  /*
  DocumentReference ref = await db.collection("noticias")
  .add(
      {
        "titulo" : "Ondas de calor em São Paulo",
        "descricao" : "texto de exemplo..."
      }
  );

  //print("item salvo: " + ref.documentID );

  db.collection("noticias").document("-LhaOOJeVlsPbbAoZaql").setData({
    "titulo": "Ondas de calor em São Paulo alterado",
    "descricao": "texto de exemplo..."
  });

  //FIM DE SALVANDO E ATUALIZANDO

  //REMOVENDO E RECUPERANDO

  db.collection("usuarios").document("003").delete();
  
  DocumentSnapshot snapshot = await db.collection("usuarios")
      .document("002")
      .get();

  var dados = snapshot.data;
  print("dados nome: " + dados["nome"] + " idade: " + dados["idade"] );
  
  
  QuerySnapshot querySnapshot = await db
      .collection("usuarios")
      .getDocuments();

  //print("dados usuarios: " + querySnapshot.documents.toString() );
  
  for( DocumentSnapshot item in querySnapshot.documents ){
    var dados = item.data;
    print("dados usuarios: " + dados["nome"] + " - " + dados["idade"] );
  }

  db.collection("usuarios").snapshots().listen((snapshot) {
    for (DocumentSnapshot item in snapshot.documents) {
      var dados = item.data;
      print("dados usuarios: " + dados["nome"] + " - " + dados["idade"]);
    }
  });

  //FIM DE REMOVENDO E RECUPERANDO

  //FILTROS BASICOS

  QuerySnapshot querySnapshot = await db
      .collection("usuarios")
      //.where("nome", isEqualTo: "jamilton")
      //.where("idade", isEqualTo: 31)
      .where("idade",
          isGreaterThan:
              15) //< menor, > maior, >= maior ou igual, <= menor ou igual
      //.where("idade", isLessThan: 30)
      //descendente (do maior para o menor) ascendente (do menor para o maior)
      .orderBy("idade", descending: true)
      .orderBy("nome", descending: false)
      .limit(1)
      .getDocuments();

  for (DocumentSnapshot item in querySnapshot.documents) {
    var dados = item.data;
    print("filtro nome: ${dados["nome"]} idade: ${dados["idade"]}");
  }

  //FIM FILTROS BASICOS

  //PESQUISA DE TEXTO

  
  var pesquisa = "ana";
  QuerySnapshot querySnapshot = await db
      .collection("usuarios")
      //.where("nome", isEqualTo: "jamilton")
      //.where("idade", isEqualTo: 31)
      //.where("idade", isGreaterThan: 15)//< menor, > maior, >= maior ou igual, <= menor ou igual
      //.where("idade", isLessThan: 30)
      //descendente (do maior para o menor) ascendente (do menor para o maior)
      //.orderBy("idade", descending: true )
      //.orderBy("nome", descending: false )
      //.limit(1)
      //m  m
      //10...15
      .where("nome", isGreaterThanOrEqualTo: pesquisa)
      .where("nome", isLessThanOrEqualTo: pesquisa + "\uf8ff")
      .getDocuments();

  for (DocumentSnapshot item in querySnapshot.documents) {
    var dados = item.data;
    print("filtro nome: ${dados["nome"]} idade: ${dados["idade"]}");
  }

  */

  //FIM PESQUISA DE TEXTO

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
