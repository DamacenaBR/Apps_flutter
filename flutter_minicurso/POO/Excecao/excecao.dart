
void main(){
  int resultado = 0;
  try{
    resultado = 12 ~/ 0;
  }on IntegerDivisionByZeroException{
    print('Não se pode dividir por 0 macho');
  }on Exception catch(e){
    //Quando voce precisa do onbjeto para fazer tratamento
  }catch(e,s){
    //capturar qualquer exceção(e) e a pilha de excessão
  }finally{
    print('Muitas formas de exceções');
  }
  

}