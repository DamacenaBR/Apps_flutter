class ErrorSucessInterceptor {
  static final String erroSenha = "ERROR_PASSWORD";
  static final String erroEmail = "ERROR_EMAIL";
  static final String erroLogin = "ERROR_LOGIN";
  static final String erroRegister = "ERROR_REGISTER";

  static final String loginSucess = "LOGIN_SUCESS";
  static final String registerSucess = "REGISTER_SUCESS";

  static String errorFalid(String message) {
    switch (message) {
      case 'ERROR_PASSWORD':
        return 'Senha incorreta!';
        break;
      case 'ERROR_EMAIL':
        return 'Esse email é inválido!';
        break;
      case 'ERROR_LOGIN':
        return 'Erro ao realizar o login!';
        break;
      case 'ERROR_REGISTER':
        return 'Erro ao realizar o cadastro!';
        break;
      default:
        return 'ERRO: tente novamente mais tarde.';
    }
  }

  static String sucess(String message) {
    switch (message) {
      case 'LOGIN_SUCESS':
        return 'Login realizado com sucesso!';
        break;
      case 'REGISTER_SUCESS':
        return 'Cadastro realizado com sucesso!';
        break;
      default:
        return 'ERRO: tente novamente mais tarde.';
    }
  }
}
