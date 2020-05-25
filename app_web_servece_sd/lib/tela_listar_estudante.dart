import 'package:app_web_servece_sd/rest_api.dart';
import 'package:app_web_servece_sd/tela_adicionar_estudante.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter REST API'),
      ),
      body: _body(),
      floatingActionButton: _floating(),
      
    );
  }

  _floating() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddEstudentPage(),
          ),
        );
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }

  _body() {
    return FutureBuilder(
      future: ApiService.getEstudantes(),
      builder: (context, snapshot) {
        final estudents = snapshot.data;
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                height: 2,
                color: Colors.black,
              );
            },
            itemBuilder: (context, index) {
              return _listTile(estudents, index);
            },
            itemCount: estudents.length,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  _listTile(dynamic estudents, int index) {
    return ListTile(
      title: Text(
          "ID: ${estudents[index]['id']}\nNOME: ${estudents[index]['name']}"),
      subtitle: Text('RG: ${estudents[index]['rg']}'),
      trailing: Text('NOTA: ${estudents[index]['grade']}'),
    );
  }
}