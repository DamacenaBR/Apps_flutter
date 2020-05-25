void main(){

  List lista = [1,2,3,4,5, 'bruno'];
  print(lista);
  for (var i = 0; i < lista.length; i++) {
    print(lista.elementAt(i));
    print(lista[i]);
  }

  //restrigindo a lista a aceitar somente numeros inteiro
  List<int> lista2 = [1,2,3,4,5];
  List lista3 = <int> [1,2,3,4,5];

}