import 'dart:io';

import 'package:app_telefone/ajudenos.dart';
import 'package:app_telefone/apoiadores.dart';
import 'package:app_telefone/contato.dart';
import 'package:app_telefone/contato_api.dart';
import 'package:app_telefone/tela_informacoes.dart';
import 'package:app_telefone/tela_secundaria.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.phone_in_talk,
                size: 30,
              ),
              Text(
                " TelefonesCZ",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: _body(context),
      floatingActionButton: _speedDial(context),
    );
  }

  _body(BuildContext context) {
    return FutureBuilder(
      future: ContatoApi.getContato(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
            ),
          );
        }
        List<Contato> listaContatos = snapshot.data;
        return _listView(listaContatos);
      },
    );
  }

  _listView(List<Contato> listaContatos) {
    return ListView.builder(
      itemCount: listaContatos.length,
      itemBuilder: (context, index) {
        return _itemList(context, listaContatos[index]);
      },
    );
  }

  _itemList(BuildContext context, Contato listaContato) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                listaContato.categoria,
                style: TextStyle(fontSize: 25),
              ),
              trailing: Icon(
                Icons.chevron_right,
                size: 30,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TelaSecundaria(listaContato);
                }));
              },
            ),
            Divider()
          ],
        ),
      ),
    );
  }

  _speedDial(BuildContext context) {
    return SpeedDial(
      // both default to 16
      marginRight: 18,
      marginBottom: 20,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
            child: Icon(
              Icons.error_outline,
              color: Colors.purple,
            ),
            backgroundColor: Colors.white,
            label: 'Sobre Cajazeiras',
            labelStyle: TextStyle(fontSize: 18.0, color: Colors.purple),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Informacoes_tela()));
            }),
        SpeedDialChild(
            child: Icon(
              Icons.help_outline,
              color: Colors.purple,
            ),
            backgroundColor: Colors.white,
            label: 'Ajudenos',
            labelStyle: TextStyle(fontSize: 18.0, color: Colors.purple),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return Ajudenos();
              }));
            }),
        SpeedDialChild(
            child: Icon(
              Icons.phonelink_setup,
              color: Colors.purple,
            ),
            backgroundColor: Colors.white,
            label: 'Apoiadores',
            labelStyle: TextStyle(fontSize: 18.0, color: Colors.purple),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return Apoiadores();
              }));
            }),
        SpeedDialChild(
          child: Icon(
            Icons.exit_to_app,
            color: Colors.red,
          ),
          backgroundColor: Colors.white,
          label: 'Sair',
          labelStyle: TextStyle(fontSize: 18.0, color: Colors.red),
          onTap: () {
            exit(0);
          },
        ),
      ],
    );
  }
}