// as => Typecast e renomeação de bibliotecas
// is => Retornar verdadeiro se o objeto for do mesmo tipo
// is! => Retorna falso se o obejeto for do mesmo tipo

void main() {
  String nome = "Dart";
  bool teste = nome is String;
  bool teste2 = nome is! String;

  print(teste);
  print(teste2);
}