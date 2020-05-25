
class Pessoa{
  String _nome;
  String _sobrenome;

  Pessoa(this._nome, this._sobrenome);

  void set nome(String nome){
    this._nome = nome;
  }

  String get nome{
    return _nome;
  }

  void set sobrenome(String nome){
    this._nome = nome;
  }

  String get sobrenome{
    return _nome;
  }

  @override
  String toString() {
    return "Nome: $_nome $_sobrenome";
  }
}