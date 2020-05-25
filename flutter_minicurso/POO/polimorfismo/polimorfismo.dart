void main(){
  double x = 10.0;
  double y = 2.0;

  /*Contas.mostarCalculo(new Somar(), x, y);
  Contas.mostarCalculo(new Subtrair(), x, y);
  Contas.mostarCalculo(new Multiplicar(), x, y);
  Contas.mostarCalculo(new Dividir(), x, y);*/
}

abstract class Operaracao{
  @override
  double Somar(double x, double y){
    return x + y;
  }
}

class Contas{
  static void mostrarCalculo(Operaracao op, double x, double y){
    print("O resultado é: ");
  }
}