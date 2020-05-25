
void main(){
  Pessoa pessoa1 = Pessoa('Kassio');
  Pessoa pessoa2 = Pessoa('Kassio');
  
  print(pessoa1 == pessoa2);
  print(identical(pessoa1, pessoa2));

}

class Pessoa{
  String _nome;

  Pessoa(this._nome);

  bool operator ==(dynamic objeto){
    return objeto is Pessoa && objeto._nome == _nome;
  }

  @override
  int get hashCode{
    return _nome.hashCode;
  }
}