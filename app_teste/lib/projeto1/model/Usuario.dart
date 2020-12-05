class Usuario {
  String _idUsuario;
  String _nome;
  String _email;
  String _senha;

  Usuario();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "nome": this._nome,
      "email": this._email,
    };
    return map;
  }

  Usuario.fromJson(Map<dynamic, dynamic> json) {
    _nome = json['nome'];
    _senha = json['senha'];
    _email = json['email'];
  }

  String get idUsuario => _idUsuario;
  set idUsuario(String value) {
    _idUsuario = value;
  }

  String get nome => _nome;
  set nome(String value) {
    _nome = value;
  }

  String get senha => _senha;
  set senha(String value) {
    _senha = value;
  }

  String get email => _email;
  set email(String value) {
    _email = value;
  }
}
