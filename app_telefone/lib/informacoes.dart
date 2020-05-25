import 'package:flutter/services.dart';

class Informacoes{

Future<String> getClima() async{
  var file = await rootBundle.loadString("assets/txts/clima.txt");
  String conteudo = file.toString();
  return conteudo;
}

Future<String> getEconomia() async{
  var file = await rootBundle.loadString("assets/txts/economia.txt");
  String conteudo = file.toString();
  return conteudo;
}

Future<String> getHistoria() async{
  var file = await rootBundle.loadString("assets/txts/historia.txt");
  String conteudo = file.toString();
  return conteudo;
}

}