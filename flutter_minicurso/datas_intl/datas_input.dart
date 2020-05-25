import 'dart:io';

import 'package:intl/intl.dart';

void main(){
  stdout.write("'Insira sua data de nascimento: ");
  String data = stdin.readLineSync();

  String data2 = data.split('/').reversed.join();

  DateTime data3 = DateTime.parse(data2);

  DateFormat formatador = DateFormat('dd-MM-yyyy');
  String dataBr = formatador.format(data3);

  print('Data pra salvar no BD : $data3');
  print("Data para mostrar ao usuário: $dataBr");
}