import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {
  String valor;
  TelaSecundaria(this.valor);
  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  var caminhoImagem;
  @override
  Widget build(BuildContext context) {
    
    if (this.widget.valor == "cara") {
      caminhoImagem = "assets/imagens/app5_moeda_coroa.png";
    } else {
      caminhoImagem = "assets/imagens/app5_moeda_coroa.png";
    }

    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _appBar() {
    return null;
  }

  _body() {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(caminhoImagem),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset("assets/imagens/app5_botao_voltar.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _bottomNavigationBar() {
    return null;
  }
}
