import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class Bichos extends StatefulWidget {
  @override
  _BichosState createState() => _BichosState();
}

class _BichosState extends State<Bichos> {
  AudioCache _audioCache = AudioCache(prefix: "audios/");

  _executar(String nomeAudio) {
    _audioCache.play(nomeAudio + ".mp3");
  }

  @override
  void initState() {
    super.initState();
    _audioCache.loadAll([
      "app10_cao.mp3",
      "app10_gato.mp3",
      "app10_leao.mp3",
      "app10_macaco.mp3",
      "app10_ovelha.mp3",
      "app10_vaca.mp3",
    ]);
  }

  @override
  Widget build(BuildContext context) {
    //double largura = MediaQuery.of(context).size.width;
    //double altura = MediaQuery.of(context).size.height;
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _executar("app10_cao");
          },
          child: Image.asset("assets/imagens/app10_cao.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("app10_gato");
          },
          child: Image.asset("assets/imagens/app10_gato.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("app10_leao");
          },
          child: Image.asset("assets/imagens/app10_leao.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("app10_macaco");
          },
          child: Image.asset("assets/imagens/app10_macaco.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("app10_ovelha");
          },
          child: Image.asset("assets/imagens/app10_ovelha.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("app10_vaca");
          },
          child: Image.asset("assets/imagens/app10_vaca.png"),
        )
      ],
    );
  }
}
