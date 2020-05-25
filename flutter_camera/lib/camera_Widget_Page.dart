import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CameraWidget {
  List<File> imagens = List<File>();

  StreamController _streamController = StreamController();
  Stream get saida => _streamController.stream;

  void carregaFoto() async {
    File fileImage = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 300,
      maxWidth: 300,
    );
    imagens.add(fileImage);
    _streamController.sink.add(imagens);
  }

  void limparGaleria(){
    imagens.removeRange(0, imagens.length);
    _streamController.sink.add(imagens);
  }
}
