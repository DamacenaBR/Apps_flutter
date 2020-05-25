import 'dart:io';

import "package:flutter/material.dart";

import 'ex1_listviiew.dart';

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              exit(0);
            },
          ),
        ],
      ),
      body: Container(),
      drawer: _drawer(context),
    );
  }
}

_drawer(context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(
              child: Text("M"),
              backgroundColor: Colors.white,
            ),
            onTap: () {
              print("---> circler avatar");
            },
          ),
          accountName: Text("Maria"),
          accountEmail: Text("maria@gmail.com"),
        ),
        ListTile(
          leading: Icon(Icons.list),
          title: Text("Lista Pessoas"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ExemploListView();
            }));
          },
        ),
      ],
    ),
  );
}
