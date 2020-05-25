import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';


class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela Principal"),),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                _exemploShare();
              },
              child: Text("clique 1"),
            ),
             RaisedButton(
              onPressed: (){
                _exemploUrlLaunchTelefone();
              },
              child: Text("clique 2"),
            ),
             RaisedButton(
              onPressed: (){
                _exemploUrlLaunchSms();
              },
              child: Text("clique 3"),
            ),
             RaisedButton(
              onPressed: (){
                _exemploUrlLaunchSite();
              },
              child: Text("clique 4"),
            ),
            RaisedButton(
              onPressed: (){
                _exemploUrlLaunchEmail();
              },
              child: Text("clique 5"),
            ),
          ],
        ),
      ),
    );
  }

  _exemploShare() async {
    await Share.share("Eu sou um texto compartilhado.");
  }

  _exemploUrlLaunchTelefone() async {
    String telefone = "(83)889989988";
    await launch("tel:$telefone");
  }

  _exemploUrlLaunchSms() async {
    String telefone = "(83)889989988";
    await launch("sms:$telefone");
  }

  _exemploUrlLaunchSite() async {
    String url = "//flutter.dev";
    await launch("http:$url");
  }

  _exemploUrlLaunchEmail() async {
    String mailto = "danielvieiramelolima@gmail.com";
    String subject = "Assunto";
    String body = "Eu sou o corpo do email.";
    await launch("mailto:$mailto?subject=$subject&body=$body"); 
  }
}