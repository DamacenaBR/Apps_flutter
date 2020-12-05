import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future _recuperarImagem(bool daCamera) async {
    if (daCamera) {
      ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      ImagePicker.pickImage(source: ImageSource.gallery);
    }
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
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
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
        ],
      ),
    );
  }
}
