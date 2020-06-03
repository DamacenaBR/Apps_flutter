class Endereco {
  String rua;
  String bairro;
  String numero;

  Endereco({this.rua, this.bairro, this.numero});

  Endereco.fromJson(Map<String, dynamic> json) {
    rua = json['rua'];
    bairro = json['bairro'];
    numero = json['numero'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rua'] = this.rua;
    data['bairro'] = this.bairro;
    data['numero'] = this.numero;
    return data;
  }
}