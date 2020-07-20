import 'package:curso_flutter/tab_bar_abas/PrimeiraPagina.dart';
import 'package:curso_flutter/tab_bar_abas/SegundaPagina.dart';
import 'package:curso_flutter/tab_bar_abas/TerceiraPagina.dart';
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
    return Scaffold(appBar: _appBar(), body: _body());
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text("Abas"),
      bottom: TabBar(
        controller: _tabController,
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.email),
          ),
          Tab(
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }

  _body() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[PrimeiraPagina(), SegundaPagina(), TerceiraPagina()],
    );
  }
}
