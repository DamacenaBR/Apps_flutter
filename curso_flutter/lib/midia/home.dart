import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer _audioPlayer = AudioPlayer();
  AudioCache _audioCache = AudioCache(prefix: "audios/");
  bool _primeiraExecucao = true;
  double _volume = 0.5;
  String _label = "Volume selecionado";

  /*
  //executando musica por url
  _executar() async {
    String url =
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3";
    int resultado = await audioPlayer.play(url);
    if (resultado == 1) {
    } else {
      print("Erro ao carregar o audio");
    }
  }
  */

  //executando musica local app
  _executar() async {
    _audioPlayer.setVolume(_volume);
    if (_primeiraExecucao) {
      _audioPlayer = await _audioCache.play("musica.mp3");
      _primeiraExecucao = false;
    } else {
      _audioPlayer.resume();
    }
  }

  _pausar() async {
    int resultado = await _audioPlayer.pause();
    if (resultado == 1) {
      print("Pusado com sucesso");
    } else {
      print("Erro ao pausar");
    }
  }

  _parar() async {
    int resultado = await _audioPlayer.stop();
    if (resultado == 1) {
      print("Parado com sucesso");
    } else {
      print("Erro ao parar");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blue,
      title: Text("Midia"),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(12),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 35),
            child: Slider(
                divisions: 10,
                label: _label,
                value: _volume,
                max: 1,
                onChanged: (novoVolume) {
                  setState(() {
                    _volume = novoVolume;
                    _label = "Volume " + novoVolume.toString();
                  });
                  _audioPlayer.setVolume(novoVolume);
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/executar.png"),
                  onTap: () {
                    _executar();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/pausar.png"),
                  onTap: () {
                    _pausar();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/parar.png"),
                  onTap: () {
                    _parar();
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _bottomNavigationBar() {
    return null;
  }
}
