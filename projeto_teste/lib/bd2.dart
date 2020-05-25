import 'package:projeto_teste/bd.dart' as bd;

class PessoaDAO{
  getConnection() async{
    return await bd.iniciaConexao();
  }

  Future<void> inserir() async{
    var conn = await PessoaDAO().getConnection();
    conn.open();
    print("Deu certo");
  }
}