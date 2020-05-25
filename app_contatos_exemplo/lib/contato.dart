
class Contato{
  String nome;
  String email;
  String telefone;

  Contato({this.nome, this.email, this.telefone});

  Contato.fromJson(Map<dynamic, dynamic> json){
    nome = json['nome'];
    email = json['email'];
    telefone = json['telefone'];
  }

  Map<dynamic, dynamic> toJson(){
    Map<dynamic, dynamic> json = Map<dynamic, dynamic>();
    json['nome'] = nome;
    json['email'] = email;
    json['telefone'] = telefone;
    return json;
  }

  @override
  String toString() {
    return "Nome: $nome";
  }

}