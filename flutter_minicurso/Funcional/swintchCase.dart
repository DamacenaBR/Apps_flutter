import 'dart:io';

void main(){
  //String comando = 'ABERTO';
  String comando = stdin.readLineSync();
  String pedido;

  switch(comando){
    case 'FECHADO':
      pedido = 'fechado';
      break;
    case 'PENDENTE':
      pedido = 'pendente';
      break;
    case 'ABERTO':
      pedido = 'aberto';
      break;
    default:
      pedido = 'desconhecido';
  }

  print(pedido);
}