import 'package:flutter/material.dart';
import 'package:flutter_camera/camera_Widget_Page.dart';

class CameraWidgetPage extends StatelessWidget {
  CameraWidget cameraWidget = new CameraWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Camera List"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.remove_circle),
            onPressed: (){
              cameraWidget.limparGaleria();
            },
          )
        ],
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cameraWidget.carregaFoto();
        },
        child: Icon(Icons.photo_camera),
      ),
    );
  }

  _body(BuildContext context) {
    return StreamBuilder(
      stream: cameraWidget.saida,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text("Galeria Vazia!"),
          );
        }
        return GridView.count(
            crossAxisCount: 3,
            children: List.generate(snapshot.data.length, (index) {
              return Center(
                  child: Image.file(
                snapshot.data[index],
                height: 110,
              ));
            }));
      },
    );
  }
}
