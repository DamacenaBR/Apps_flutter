
class Funcionario{
  String _nome, _sobrenome;

  Funcionario(this._nome, this._sobrenome);
  Funcionario.somenteNome(this._nome);

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

class Gerente extends Funcionario{
  String _setor;

  Gerente(String nome, String sobrenome, this._setor) : super(nome, sobrenome);

  void set setor(String setor){
    this._setor = setor;
  }

  String get setor{
    return _setor;
  }

  @override
  String toString() {
    return "Nome: $_nome $_sobrenome, Setor: $_setor";
  }
}

void main(){
  Gerente gerente = Gerente('Bruno', 'Silva' , 'Financeiro');
  print(gerente);
}