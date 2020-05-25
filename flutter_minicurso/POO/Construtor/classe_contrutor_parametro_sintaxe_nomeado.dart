void main() {
  Pessoa pessoa = Pessoa(
    nome: "Bruno",
    sobrenome: 'Silva',
  );

  print(pessoa.nome);
}

class Pessoa {
  String nome;
  String sobrenome;

  //as variaveis devem ser publicas
  Pessoa({this.nome, this.sobrenome});
}
