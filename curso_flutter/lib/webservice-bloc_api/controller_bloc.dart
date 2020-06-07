import 'dart:async';
import 'dart:convert';
import 'package:curso_flutter/webservice-bloc_api/cep.dart';
import 'package:http/http.dart' as http;

class Mybloc {
  final StreamController<String> _streamCep = StreamController<String>();
  Sink<String> get input => _streamCep.sink;
  Stream<Cep> get output => _streamCep.stream.asyncMap((cep) => _recuperarCep(cep));

  Future<Cep> _recuperarCep(String cep) async {
    String cepRecuperado = cep;
    String url = "https://viacep.com.br/ws/${cepRecuperado}/json/";

    http.Response response;

    response = await http.get(url);
    if (response.statusCode == 200) {
      return Cep.fromJson(json.decode(response.body));
    }
    else{
      return null;
    }
  }

}
