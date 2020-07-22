import 'package:curso_flutter/app10_aprenda_ingles/Bichos.dart';
import 'package:curso_flutter/app10_aprenda_ingles/Numeros.dart';
import 'package:curso_flutter/app10_aprenda_ingles/Vogais.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text("Aprenda inglês"),
      bottom: TabBar(
        indicatorWeight: 4,
        controller: _tabController,
        indicatorColor: Colors.white,
        //labelColor: Colors.green,
        //unselectedLabelColor: Colors.purple,
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        tabs: <Widget>[
          Tab(text: "Bichos"),
          Tab(
            text: "Números",
          ),
          Tab(
            text: "Vogais",
          )
        ],
      ),
    );
  }

  _body() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[Bichos(), Numeros(), Vogais()],
    );
  }
}
