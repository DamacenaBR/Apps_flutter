
class Pizza{
  String nome;
  String componentes;
  String broto;
  String media;
  String grande;

  Pizza(this.nome, this.componentes);

  Pizza.fromJson(Map<dynamic, dynamic> json){
    nome = json['nome'];
    componentes = json['componentes'];
    broto = json['broto'];
    media = json['media'];
    grande = json['grande'];
  }

  Map<dynamic, dynamic> toJson(){
    Map<dynamic, dynamic> json = Map<dynamic, dynamic>();
    json['nome'] = nome;
    json['componentes'] = componentes;
    json['broto'] = broto;
    json['media'] = media;
    json['grande'] = grande;
  }

  @override
  String toString(){
    return "Nome: $nome => Componentes : $componentes";
  }
}