import 'package:postgres/postgres.dart'; //Este import e necessario para que possamos utilizar a classe do postgres presente no Dart

/* Criar um método que inicie a conexão com o BD*/
iniciaConexao()async{ /* Sempre utilizar métodos assíncronos*/
  return new PostgreSQLConnection(
      "localhost", // Rede local;
      5432,        // Porta de acesso ao BD;
      "pessoa",      // Nome do banco de dados a ser acessado;
      username: "postgres", // Login do BD;
      password: "1234");  // Senha do BD;
}
