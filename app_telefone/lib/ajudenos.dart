import 'package:app_telefone/funcoes_validadoras.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Ajudenos extends StatefulWidget {
  @override
  _AjudenosState createState() => _AjudenosState();
}

class _AjudenosState extends State<Ajudenos> {
  final _formKey = GlobalKey<FormState>();
 
  String _nome;
  String _telefone;
  String _mensagem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ajude-nos",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Elogios/sugestões",
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  labelText: "Nome",
                  errorStyle: TextStyle(fontSize: 15),
                  labelStyle: TextStyle(color: Colors.purple, fontSize: 20),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                ),
                validator: (nome) {
                  return validaNome(nome);
                },
                onSaved: (nome){
                  _nome = nome;
                },
              ),
              Divider(color: Colors.transparent),
              TextFormField(
                keyboardType: TextInputType.phone,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  labelText: "Telefone",
                  errorStyle: TextStyle(fontSize: 15),
                  labelStyle: TextStyle(color: Colors.purple, fontSize: 20),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                ),
                validator: (telefone) {
                  return validaTelefone(telefone);
                },
                onSaved: (telefone){
                  _telefone = telefone;
                },
              ),
              Divider(color: Colors.transparent),
              TextFormField(
                maxLength: 150,
                maxLines: 5,
                keyboardType: TextInputType.text,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  labelText: "Mensagem",
                  errorStyle: TextStyle(fontSize: 15),
                  labelStyle: TextStyle(color: Colors.purple, fontSize: 20),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                ),
                validator: (mensagem) {
                  return validaMensagem(mensagem);
                },
                onSaved: (mensagem){
                  _mensagem = mensagem;
                },
              ),
              Divider(color: Colors.transparent),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.purple,
                    child: Text(
                      "Envie",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print("Validado com sucesso!");
                        _formKey.currentState.save();
                        _exemploUrlLaunchEmail("bruno26cz@gmail.com", 'Mensagem', 'Nome: ${_nome}\nTelefone: ${_telefone}\nMensagem: ${_mensagem}' );
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _exemploUrlLaunchEmail(String email, String assunto, String corpo) async {
    String mailto = email;
    String subject = assunto;
    String body = corpo;
    await launch("mailto:$mailto?subject=$subject&body=$body"); 
  }

}
