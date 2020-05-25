import 'package:postgres/postgres.dart';

class BancoDeDados {
  
  Future<void> listarDados(PostgreSQLConnection conn) async {
    await conn.open();
    var r = await conn.mappedResultsQuery('SELECT * FROM PESSOA');
    for (int i = 0; i < r.length; i++) {
      print("###############");
      r[i].forEach(
          (key, map) => map.forEach((key, values) => print("$key: ${values}")));
      print("\n");
    }
    await conn.close();
  }

  Future<void> createTable(PostgreSQLConnection conn) async {
    print('Criando Tabela');
    await conn.open();
    await conn.execute(
        'CREATE TABLE Pessoa (id SERIAL PRIMARY KEY, nome VARCHAR(50) NOT NULL, idade INTEGER, email VARCHAR(255))');

    print("Tabela criada");
    await conn.close();
  }

  Future<void> inserirDados(PostgreSQLConnection conn) async {
    print('Inserindo dados');
    await conn.open();
    var dados = [
      ['Niulanio', 'niulanio.xd', 24],
      ['pedro', 'afqer.21', 25],
      ['kassius', 'asdfha', 32],
    ];

    for (int i = 0; i < dados.length; i++) {
      var nome = dados[i][0];
      var email = dados[i][1];
      var age = dados[i][2];
      int idade = int.parse('$age');

      await conn.query(
          "INSERT INTO pessoa(nome,email,idade)values ('$nome','$email',$idade)");
    }

    await conn.close();

    print('Dados Inseridos');
  }

  Future<void> deletarLinhas(PostgreSQLConnection conn) async {
    await conn.open();
    await conn.execute('DELETE FROM Pessoa');
    await conn.close();
  }

  Future<void> deletarTabela(PostgreSQLConnection conn) async {
    await conn.open();
    await conn.execute('DROP TABLE Pessoa');
    await conn.close();
  }
}
