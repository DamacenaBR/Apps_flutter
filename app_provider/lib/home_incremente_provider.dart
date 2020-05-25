import 'package:app_provider/home_Herois.dart';
import 'package:app_provider/incremente_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeIncremente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Consumer<IncrementeProvider>(
          builder: (context, incrementeProvidor, child) {
            return Text("${incrementeProvidor.valor}",style: TextStyle(fontSize: 20),);
          },
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('herois'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeIncrementeHerois()));
            },
          )
        ],
      ),
      body: Center(
        child: Consumer<IncrementeProvider>(
          builder: (context, incrementeProvidor, child) {
            return Text("${incrementeProvidor.valor}",style: TextStyle(fontSize: 50));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Consumer<IncrementeProvider>(
            builder: (context, incrementeProvidor, child) {
              return Text("${incrementeProvidor.valor}",style: TextStyle(fontSize: 20));
            },
          ),
        onPressed: () {
          Provider.of<IncrementeProvider>(context).incremente();
        },
      ),
    );
  }
}