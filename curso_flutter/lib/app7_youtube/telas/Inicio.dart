import 'package:curso_flutter/app7_youtube/model/Videos.dart';
import 'package:curso_flutter/app7_youtube/telas/Api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Inicio extends StatefulWidget {
  String resulPesquisa;
  Inicio(this.resulPesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String pesquisa) {
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return null;
  }

  _body() {
    return FutureBuilder<List<Video>>(
        future: _listarVideos(widget.resulPesquisa),
        builder: (context, snapshot) {
          String _resultado;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                List<Video> _listVideos = snapshot.data;
                return _listViewSeparated(_listVideos);
              } else {
                return Center(
                  child: Text("Nenhum dado a ser exibido!"),
                );
              }
              break;
          }
        });
  }

  _listViewSeparated(List<Video> videos) {
    return ListView.separated(
      itemCount: videos.length,
      separatorBuilder: (context, index) => Divider(
        height: 2,
        color: Colors.grey,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _listView(videos[index]);
      },
    );
  }

  _listView(Video video) {
    return GestureDetector(
          onTap: (){
            FlutterYoutube.playYoutubeVideoById(
              apiKey: CHAVE_YOUTUBE_API,
              videoId: video.id,
              autoPlay: true);
          },
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(video.imagem)),
            ),
          ),
          _listTile(video),
        ],
      ),
    );
  }

  _listTile(Video video) {
    return ListTile(
      title: Text(video.titulo),
      subtitle: Text(video.canal),
    );
  }
}
