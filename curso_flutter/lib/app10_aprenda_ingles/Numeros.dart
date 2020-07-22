import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class Numeros extends StatefulWidget {
  @override
  _NumerosState createState() => _NumerosState();
}

class _NumerosState extends State<Numeros> {
  AudioCache _audioCache = AudioCache(prefix: "audios/");

  _executar(String nomeAudio) {
    _audioCache.play(nomeAudio + ".mp3");
  }

  @override
  void initState() {
    super.initState();
    _audioCache.loadAll([
      "app10_1.mp3",
      "app10_2.mp3",
      "app10_3.mp3",
      "app10_4.mp3",
      "app10_5.mp3",
      "app10_6.mp3",
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
            _executar("app10_1");
          },
          child: Image.asset("assets/imagens/app10_1.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("app10_2");
          },
          child: Image.asset("assets/imagens/app10_2.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("app10_3");
          },
          child: Image.asset("assets/imagens/app10_3.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("app10_4");
          },
          child: Image.asset("assets/imagens/app10_4.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("app10_5");
          },
          child: Image.asset("assets/imagens/app10_5.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("app10_6");
          },
          child: Image.asset("assets/imagens/app10_6.png"),
        )
      ],
    );
  }
}
