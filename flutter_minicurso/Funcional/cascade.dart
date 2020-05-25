void main(){
  //construtor, o dart emite o new
  List<int> lista = List();

  lista.add(1);
  lista.add(2);
  lista.add(3);
  lista.add(4);

  //notação em castata
  lista..add(5)..add(6)..add(7)..add(8)..add(9)..add(10);

    
  print(lista);

}