class Mensagem{
  String mensagem;
  bool resultado;

  Mensagem({this.mensagem,this.resultado});

  String get getMensagem => mensagem;
  set setMensagem(String value) {
    mensagem = value;
  }

  bool get getResultado => resultado;
  set setResultado(bool value) {
    resultado = value;
  }

}