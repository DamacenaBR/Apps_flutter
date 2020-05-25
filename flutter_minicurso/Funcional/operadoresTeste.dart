// as => Typecast e renomeação de bibliotecas
// is => Retornar verdadeiro se o objeto for do mesmo tipo
// is! => Retorna falso se o obejeto for do mesmo tipo

void main(){
  num n = 155;
  int numero = n as int;
  print(numero);
  print('${numero.runtimeType}'); // retorna tipo
}