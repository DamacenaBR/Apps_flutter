void main(){
  var pais1 = 'Brasil';
  var pais2 = 'Itália';
  var pais3 = 'Alemanha';
  exibirPaises(pais1, pais2);
  exibirPaises(pais1, pais2,pais3);

  int number = 5;
  multiplicadoPorDez(number);
  multiplicadoPorDez(number, padrao: 50);//redefinindo valor padrao


  String nome = "Bruno";
  String sobrenome = "Silva";
  exibirNomeCompleto1('bruno', 'silva');
  exibirNomeCompleto2(nome: nome, sobrenome: sobrenome);
  exibirNomeCompleto2(sobrenome: sobrenome, nome: nome);
}

//função default posicional
void exibirPaises(String pais1, String pais2, [String pais3 = 'nada']){ // O terceiro parâmetro não é obrigatorio definir um valor
  print(pais1);
  print(pais2);
  print(pais3);
}

void multiplicadoPorDez(int number, {int padrao = 10}){
  print(number * padrao);
}


void exibirNomeCompleto1(String nome, String sobrenome){
  print('$nome $sobrenome');
}

//função nomeado
void exibirNomeCompleto2({String nome, String sobrenome}){
  print('$nome $sobrenome');
}



