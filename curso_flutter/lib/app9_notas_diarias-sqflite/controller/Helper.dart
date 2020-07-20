import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final String _nomeDB = "banco_minhas_anotacoes.db";
  static final int _versaoDB = 1;

  static final String nomeTabela = "anotacoes";
  static final String tabelaID = "id";
  static final String tabelaTitulo = "titulo";
  static final String tabelaDescricao = "descricao";
  static final String tabelaData = "data";

  // Aplicação do padrão Singleton na classe.
  DBHelper._privateConstructor();
  static final DBHelper instance =
      DBHelper._privateConstructor();

  //contrutor padrão retornando a instancia singleton
  /*factory AnatocaoesHelper(){
    return _instance;
  }
  */

  // Configurar a intância única da classe.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  // Abre a base de dados (e cria quando ainda não existir).
  Future<Database> _initDatabase() async {
    final String caminhoDoBanco = await getDatabasesPath();
    final String _localBanco = _nomeDB;
    var db = join(caminhoDoBanco, _localBanco);

    return await openDatabase(
      db,
      version: _versaoDB,
      onCreate: _criarBanco,
    );
  }

  Future<void> _criarBanco(Database db, int novaVersao) async {
    List<String> queryes = [
      "CREATE TABLE $nomeTabela(id INTEGER PRIMARY KEY AUTOINCREMENT, $tabelaTitulo TEXT, $tabelaDescricao VARCHAR, $tabelaData DATETIME);"
    ];

    for (String query in queryes) {
      await db.execute(query);
    }
  }
}
