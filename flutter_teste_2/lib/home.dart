import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Texte'),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: StreamBuilder(
              stream: Firestore.instance.collection('listas').snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshots) {
                if (!snapshots.hasData) {
                  return const Text("Carregando");
                }
                ;
                return ListView.builder(
                  itemCount: snapshots.data.documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot doc = snapshots.data.documents[index];
                    return ListTile(
                      leading: Icon(Icons.panorama),
                      title: doc['nome'],
                      trailing: GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.delete),
                      ),
                    );
                  },
                );
              }),
    );
  }
}
