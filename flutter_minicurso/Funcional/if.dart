import 'dart:io';

void main(){
  int idade = 17;
  String faixaEtaria = stdin.readLineSync(); //função input

  if(idade < 12){
    faixaEtaria = "Criança";
  }
  else if(idade >= 12 && idade < 18){
    faixaEtaria = "Adolescente";
  }
  else if(idade >= 18 && idade < 60){
    faixaEtaria = "Adulto";
  }
  else{
    faixaEtaria = "Idoso";
  }

  print("Voce é: $faixaEtaria");
}