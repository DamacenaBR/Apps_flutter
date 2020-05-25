import 'dart:async';
import 'package:postgres/postgres.dart';

class TelaWidget {

  Future<void> inserirDados(PostgreSQLConnection conn, String nome, String email, int idade) async {
    await conn.open();
    await conn.query("INSERT INTO pessoa(nome,email,idade)values ('$nome','$email','$idade')");
    await conn.close();
  }
}
