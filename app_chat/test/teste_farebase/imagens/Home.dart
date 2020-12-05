import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

File _imagem;
String _statusUpload = "Upload não iniciado";
String _urlImagemRecuperada = null;

class _HomeState extends State<Home> {
  Future _recuperarImagem(bool daCamera) async {
    File imagemSelecionada;
    if (daCamera) {
      imagemSelecionada =
          await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      imagemSelecionada =
          await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _imagem = imagemSelecionada;
    });
  }

  Future _uploadImagem() async {
    //referencia arquivo
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference pastaRaiz = storage.ref();
    StorageReference arquivo = pastaRaiz.child("fotos").child("foto1.jpg");

    //fazer upload imagem
    StorageUploadTask task = arquivo.putFile(_imagem);

    //controlar progresso de tarefa
    task.events.listen((storageEvent) {
      if (storageEvent.type == StorageTaskEventType.progress) {
        setState(() {
          _statusUpload = "Em progresso";
        });
      } else if (storageEvent.type == StorageTaskEventType.success) {
        setState(() {
          _statusUpload = "Upload realizado com sucesso";
        });
      } else if (storageEvent.type == StorageTaskEventType.failure) {
        setState(() {
          _statusUpload = "Upload não foi realizado com sucesso";
        });
      } else if (storageEvent.type == StorageTaskEventType.pause) {
        setState(() {
          _statusUpload = "Upload pausado";
        });
      }
    });

    //Recuperar url da imagem
    task.onComplete.then((StorageTaskSnapshot snapshot) {
      _recuperarUrlImagem(snapshot);
    });
  }

  Future _recuperarUrlImagem(StorageTaskSnapshot snapshot) async {
    String url = await snapshot.ref.getDownloadURL();
    print(url);
    setState(() {
      _urlImagemRecuperada = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text("Selecionar Imagens"),
      backgroundColor: Colors.blue,
    );
  }

  _body() {
    return SingleChildScrollView(
        child: Center(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                _statusUpload,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            RaisedButton(
              child: Text("Camera"),
              onPressed: () {
                _recuperarImagem(true);
              },
            ),
            RaisedButton(
              child: Text("Galeria"),
              onPressed: () {
                _recuperarImagem(false);
              },
            ),
            _imagem == null
                ? (Container())
                : Container(
                    height: 300,
                    width: 200,
                    child: Image.file(_imagem),
                  ),
            _imagem == null
                ? (Container())
                : RaisedButton(
                    child: Text("Upload Storage"),
                    onPressed: () {
                      _uploadImagem();
                    },
                  ),
            _urlImagemRecuperada == null
                ? (Container())
                : Container(
                    height: 300,
                    width: 200,
                    child: Image.network(_urlImagemRecuperada),
                  )
          ],
        ),
      ),
    ));
  }
}
