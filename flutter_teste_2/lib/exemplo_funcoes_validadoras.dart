
String validaNome(String nome) {    
  nome = nome.trim();
  if (nome.length <= 3) {
    return "Digite mais que 3 caracteres para nome";
  } else if (nome.length >= 10) {
    return "Digite menos que 10 caracteres para nome";
  } 
  return null;
}

String validaCpf(String cpf) {
  String pattern = '^[0-9]{3}\.[0-9]{3}\.[0-9]{3}\-[0-9]{2}\$';
  RegExp regExpCpf = new RegExp(pattern);
  if ( ! regExpCpf.hasMatch(cpf)) {
    return "Use o formato: xxx.xxx.xxx-xx";
  }
  return null;
}

String validaTelefone(String telefone) {
  String pattern = '^[1-9]{2}-9[7-9]{1}[0-9]{3}-[0-9]{4}\$';
  RegExp regExpTel = new RegExp(pattern);
  if (!regExpTel.hasMatch(telefone)) {
    return "Use o formato: xx-9xxxx-xxxx";
  }
  return null;
}

String validaEmail(String email) {
  String pattern = '^[a-z0-9.]+@[a-z0-9]+\.[a-z]+\.([a-z]+)?\$';
  RegExp regExpEmail = new RegExp(pattern);
  if (!regExpEmail.hasMatch(email)) {
    return "Use o formato: xxxx@xxx.xxx";
  }
  return null;
}


