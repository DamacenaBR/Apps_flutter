
class Bebida{
  String nome;
  String descricao;
  String preco;

  Bebida(this.nome,this.descricao, this.preco);

  Bebida.fromJson(Map<dynamic, dynamic> json){
    nome = json['nome'];
    descricao = json['descricao'];
    preco = json['preco'];
  }

  Map<dynamic, dynamic> toJson(){
    Map<dynamic, dynamic> json = Map<dynamic, dynamic>();
    json['nome'] = nome;
    json['descricao'] = descricao;
    json['preco'] = preco;
  }

  @override
  String toString(){
    return "Nome: $nome => Valor : $preco => Descricao : $descricao";
  }
}