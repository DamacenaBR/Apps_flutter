import 'package:app_chat/model/Conversa.dart';
import 'package:flutter/material.dart';

class AbaConversas extends StatefulWidget {
  @override
  _AbaConversasState createState() => _AbaConversasState();
}

class _AbaConversasState extends State<AbaConversas> {
  List<Conversa> listaConversas = [
    Conversa("Ana Clara", "Olá tudo bem",
        "https://firebasestorage.googleapis.com/v0/b/appchat-9317f.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=8dc1d225-dbdf-4bd4-8452-a52ca700c9e9"),
    Conversa("Pedro Silva", "Me mando o nome daquela série que falamos",
        "https://firebasestorage.googleapis.com/v0/b/appchat-9317f.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=1d053759-f763-4878-8aeb-0726c2ef0ab5"),
    Conversa("Marcela Almeida", "Vamos sair hoje?",
        "https://firebasestorage.googleapis.com/v0/b/appchat-9317f.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=3f504f8c-39f8-4023-b390-17408163b6ef"),
    Conversa("José renato", "Não vai acreditar no que tenho que te contar...",
        "https://firebasestorage.googleapis.com/v0/b/appchat-9317f.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=d61ed2a5-7bc6-4198-a405-d03d7c7944e7"),
    Conversa("Jamilto Damasceno", "Curso novo!! depois dá uma olhada!!!",
        "https://firebasestorage.googleapis.com/v0/b/appchat-9317f.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=76b6d7e4-8849-4e1a-8c22-441e946cd7ff"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listaConversas.length,
        itemBuilder: (context, indice) {
          Conversa conversa = listaConversas[indice];
          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            leading: CircleAvatar(
              maxRadius: 30,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(conversa.caminhoFoto),
            ),
            title: Text(
              conversa.nome,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(conversa.mensagem,
                style: TextStyle(color: Colors.grey, fontSize: 14)),
          );
        });
  }
}
