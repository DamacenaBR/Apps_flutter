import 'package:app_secretaria/model/cadastro.dart';
class Pessoa {
  String nome;
  String cpf;
  //String rg;
  String dataNascimento;
  String telefone;
  String email;
  Endereco endereco;
  Cadastro cadastro;

  Pessoa(
      {this.nome,
      this.cpf,
      //this.rg,
      this.dataNascimento,
      this.telefone,
      this.email,
      this.endereco,
      this.cadastro});

  Pessoa.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    cpf = json['cpf'];
    //rg = json['rg'];
    dataNascimento = json['dataNascimento'];
    telefone = json['telefone'];
    email = json['email'];
    endereco = json['endereco'] != null
        ? new Endereco.fromJson(json['endereco'])
        : null;
    cadastro = json['cadastro'] != null
        ? new Cadastro.fromJson(json['cadastro'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    //data['rg'] = this.rg;
    data['dataNascimento'] = this.dataNascimento;
    data['telefone'] = this.telefone;
    data['email'] = this.email;
    if (this.endereco != null) {
      data['endereco'] = this.endereco.toJson();
    }
    if (this.cadastro != null) {
      data['cadastro'] = this.cadastro.toJson();
    }
    return data;
  }
}