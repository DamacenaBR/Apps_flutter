import 'package:flutter/material.dart';

class Inscricao extends StatefulWidget {
  @override
  _InscricaoState createState() => _InscricaoState();
}

class _InscricaoState extends State<Inscricao> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return null;  
  }

  _body() {
    return Center(
      child: Text("Incrições"),
    );
    
  }
}