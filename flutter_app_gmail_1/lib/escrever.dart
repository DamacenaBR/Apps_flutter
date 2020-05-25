import 'package:flutter/material.dart';

class EscreverEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _bady(),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors.red,
      title: Text("Escrever"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.attachment),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }

  _bady() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "De",
                hintStyle: TextStyle(fontSize: 20),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Para",
                hintStyle: TextStyle(fontSize: 20),
                icon: IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildTextFild() {
  return TextField(
    decoration: null,
  );
}
