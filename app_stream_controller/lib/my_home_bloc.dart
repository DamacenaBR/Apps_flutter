import 'dart:async';

class MyHomeBLoc {
  int cont = 0;

  StreamController _streamController = StreamController();
  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;

  void incrementCounter(){
    cont++;
    input.sink.add(cont);
  }
}
