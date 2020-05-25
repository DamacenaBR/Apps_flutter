
import 'package:flutter/material.dart';
import 'package:projeto_teste/bd2.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaPrincipal(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Teste"),
      ),
      body: _body(),
    );
  }
  _body(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Nome", border: OutlineInputBorder()),
                  ),
                  
                  Divider(),
                  RaisedButton(
                    child: Text("Validar"),
                    onPressed: (){
                      PessoaDAO().inserir();                     
                    },
                  ),
                ],
              ),
            ),
          ),
        
      
    );
  } 
}