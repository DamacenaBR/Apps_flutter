import 'dart:async';

import 'package:app_telefone/informacoes.dart';
import 'package:flutter/material.dart';

class Informacoes_tela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Sobre Cajazeiras"),
            centerTitle: true,
            backgroundColor: Colors.purple,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.cloud),
                ),
                Tab(
                  icon: Icon(Icons.pie_chart),
                ),
                Tab(
                  icon: Icon(Icons.bookmark),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              _tabView("Clima", Informacoes().getClima()),
              _tabView("Economia", Informacoes().getEconomia()),
              _tabView("História", Informacoes().getHistoria()),
            ],
          ),
        ));
  }

  _tabView(String nome, Future<String> future) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Text(
              nome,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            Divider(),
            FutureBuilder(
              future: future,
              builder: (BuildContext context, AsyncSnapshot snapshot){
                return Text(
                  "${snapshot.data}", textAlign: TextAlign.justify, style: TextStyle(fontSize: 25),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
