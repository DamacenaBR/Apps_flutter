import 'package:flutter/material.dart';

class Apoiadores extends StatefulWidget {
  @override
  _ApoiadoresState createState() => _ApoiadoresState();
}

class _ApoiadoresState extends State<Apoiadores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Apoiadores",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.purple,
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                "assets/imagens/imagem 3.png",
              ),
              Image.asset(
                "assets/imagens/imagem 4.jpg",
              ),
              Image.asset(
                "assets/imagens/imagem 2.jpeg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
