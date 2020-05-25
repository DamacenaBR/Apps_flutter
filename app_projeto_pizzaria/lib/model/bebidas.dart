
class Bebida{
  String nome;
  String tamanho;
  String numero;
  String descricao;
  String preco;

  Bebida(this.nome,this.descricao, this.preco);

  Bebida.fromJson(Map<dynamic, dynamic> json){
    nome = json['nome'];
    tamanho = json['tamanho'];
    numero = json['numero'];
    descricao = json['descricao'];
    preco = json['preco'];
  }

  Map<dynamic, dynamic> toJson(){
    Map<dynamic, dynamic> json = Map<dynamic, dynamic>();
    json['nome'] = nome;
    json['tamanho'] = tamanho;
    json['numero'] = numero;
    json['descricao'] = descricao;
    json['preco'] = preco;
  }

  @override
  String toString(){
    return "Nome: $nome => Valor : $preco => Descricao : $descricao";
  }
}