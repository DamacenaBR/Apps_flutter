class Produto {
  String nome;
  String descricao;
  double preco;
  //bool compra;

  Produto({this.nome,String descricao, double preco});

  Produto.fromJson(Map<dynamic, dynamic> json){
    nome = json['nome'];
    descricao = json['descricao'];
    preco = json['preco'];
  }

  Map<dynamic, dynamic> toJson(){
    Map<dynamic, dynamic> json = Map<dynamic, dynamic>();
    json['nome'] = nome;
    json['descricao'] = descricao;
    json['preco'] = preco;
    return json;
  }
}