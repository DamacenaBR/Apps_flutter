import 'dart:async';

class MyHomeBLoc {
  int cont = 0;

  StreamController _streamController = StreamController();
  Stream get saida => _streamController.stream;

  void incrementCounter(){
    cont++;
    _streamController.sink.add(cont);
  }
}
