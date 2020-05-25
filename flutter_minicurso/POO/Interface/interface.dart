abstract class ExemploInterface{
  void teste();
}

class Teste implements ExemploInterface{
  @override
  void teste(){
    print("Exempo de uso imterface no Dart!");
  }
}

void main(){
  Teste t = Teste();

  t.teste();
}