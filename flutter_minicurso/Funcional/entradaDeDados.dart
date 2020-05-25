import 'dart:convert';
import 'dart:io';

void main(){
  stdout.write("Informe seu nome: ");// não quebra  a linha
  var nome = stdin.readLineSync(encoding: Encoding.getByName("utf-8"));
  print('Bem vindo ao curso de Dart $nome!');
}