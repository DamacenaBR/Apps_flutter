String validaNome(String nome) {
  nome = nome.trim();
  if (nome.length <= 3) {
    return "Digite mais que 3 caracteres para nome";
  } else if (nome.length >= 10) {
    return "Digite menos que 10 caracteres para nome";
  }
  return null;
}

String validaTelefone(String telefone) {
  //expressao regular
  String pattern = '^[1-9]{2}-9[7-9]{1}[0-9]{3}-[0-9]{4}\$';
  RegExp regExpTel = new RegExp(pattern);
  if (!regExpTel.hasMatch(telefone)) {
    return "Use o formato: xx-9xxxx-xxxx";
  }
  return null;
}

String validaMensagem(String texto) {
  if (texto.isEmpty) {
    return "Prencher esse cammpo!";
  } else if (texto.length < 10) {
    return "Use mais que DEZ caracteres";
  }
  return null;
}
