String validarNome(String nome) {
  nome = nome.trim();
  if (nome.length <= 3) {
    return "Digite mais que 3 caracteres para nome";
  } else if (nome.length >= 10) {
    return "Digite menos que 10 caracteres para nome";
  }
  return null;
}

String validarTelefone(String telefone) {
  //expressao regular
  String pattern = '^[1-9]{2}-9[7-9]{1}[0-9]{3}-[0-9]{4}\$';
  RegExp regExpTel = new RegExp(pattern);
  if (!regExpTel.hasMatch(telefone)) {
    return "Use o formato: xx-9xxxx-xxxx";
  }
  return null;
}

String validarEmail(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(email)) {
    return "[Campo invalido, Email inválido]";
  }
}


String validarCpf(String cpf) {
  String pattern = '[0-9]{3}\.?[0-9]{3}\.?[0-9]{3}\-?[0-9]{2}\$';
  RegExp regExpCpf = new RegExp(pattern);
  if (!regExpCpf.hasMatch(cpf)) {
    return "[Campo invalido, CPF inválido]";
  }
}

String validarRg(String cpf) {
  String pattern = '"[A-Z]{0,2}[0-9]{2}\\.?[0-9]{3}\\.?[0-9]{3}\\.?[0-9][A-Z\\s]{0,10}"\$';
  RegExp regExpCpf = new RegExp(pattern);
  if (!regExpCpf.hasMatch(cpf)) {
    return "[Campo invalido, RG inválido]";
  }
}


